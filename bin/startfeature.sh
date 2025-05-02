#! /usr/bin/env bash

set -e

help() {
  echo "Usage: $0 PROJECT BRANCH_NAME"
  echo
  echo "PROJECT      The project directory"
  echo "BRANCH_NAME  The name of the branch in Git Flow format."
}

if [[ $# -ne 2 ]]; then
  help && exit 1
fi

# Parse and validate arguments
PROJECT=$1
FEATURE_NAME=$2

if [[ $2 != */* ]]; then
  >&2 echo "(EE) Invalid BRANCH_NAME format" && exit 1
fi

# Parse string
REPO_DIR="$HOME/repo/$PROJECT"
PROJECT_DIR="$HOME/worktree/$PROJECT"
BRANCH_DIR_NAME=$(echo "$FEATURE_NAME" | cut -d '/' -f 2)
WORKING_DIR="$PROJECT_DIR/$BRANCH_DIR_NAME"

if [ ! -d $REPO_DIR ]; then
  >&2 echo "(EE)  Project repo directory root doesn't exist" && exit 1
fi

if [ ! -d $PROJECT_DIR ]; then
  >&2 echo "(EE) Project worktree directory root doesn't exist" && exit 1
fi

if [ -d $WORKING_DIR ]; then
  >&2 echo "(EE) Working directory already exists" && exit 1
fi

# Processing
cd "$REPO_DIR"
MAIN_BRANCH=$(git branch --list 'ma*' | cut -c 3-)
echo $MAIN_BRANCH
git worktree add -b "$FEATURE_NAME" "$WORKING_DIR" "origin/${MAIN_BRANCH}"

cd "$WORKING_DIR"
git branch --unset-upstream
