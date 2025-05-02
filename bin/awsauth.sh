#! /bin/bash

# Variables
# =========
PROFILE=mfa
MFA_SERIAL= # null
MFA_TOKEN= # null

# Parse parameters
# ================
VALID_ARGS=$(getopt -o p: --long profile: -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
  case "$1" in
    -p | --profile)
      PROFILE=$2
      echo "Profile override=$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
  esac
done

MFA_TOKEN=$1
if [[ -z $MFA_TOKEN ]]; then
  >&2 echo "(EE) Requires AWS 2FA token"
fi

# Setup
# =====
MFA_SERIAL=$(aws configure get mfa_serial --profile "$PROFILE")
if [[ -z $MFA_SERIAL ]]; then
  >&2 echo \
    "(EE) \`mfa_serial\` configuration not set in AWS profile \"$PROFILE\"." \
    "Please set it at $HOME/.aws/credentials"""
fi

# Constants
# =========
JQ_PARSE_COMMAND='
  .Credentials |
  "aws_access_key_id \(.AccessKeyId)",
  "aws_secret_access_key \(.SecretAccessKey)",
  "aws_session_token \(.SessionToken)"'


jq -r "$JQ_PARSE_COMMAND" $HOME/.aws/sample.json |
  while read -r  LINE; do
    aws configure set $LINE --profile mfa
  done

aws sts get-session-token --serial-number "$MFA_SERIAL" \
  --token-code "$MFA_TOKEN" \
| jq -r "$JQ_PARSE_COMMAND" \
| while read -r  LINE; do
    aws configure set $LINE --profile mfa
  done
