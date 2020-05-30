#! /bin/bash

#---------------------------------------------------------------------------------------

# VARIABLES (for future reference)

PREFIX="processed-"
CANVAS_SIZE=
PROCESS_DIR="./_process"
BG_BLUR=16

#---------------------------------------------------------------------------------------

# ARGUMENT HANDLING

for i in "$@"
do
  case $i in
    -p=*|--prefix=*)
    PREFIX="${i#*=}"
    shift
    ;;
    -b=*|--bgblur=*)
    BG_BLUR="${i#*=}"
    shift
    ;;

    *)
    # unknown option
    ;;
  esac
done

CANVAS_SIZE="$1"
if ! [[ $CANVAS_SIZE =~ ^[0-9]{1,}x[0-9]{1,}$ ]]; then
  echo "Canvas size parameter must be in the <width>x<height> format" >> /dev/stderr
  exit 1
fi
shift

#---------------------------------------------------------------------------------------

# INFORMATION DUMP

echo "CANVAS SIZE = ${CANVAS_SIZE}"
echo "PREFIX      = ${PREFIX}"
echo "BG BLUR     = ${BG_BLUR}"
echo "FILE SET    = $@"
echo "---"

#---------------------------------------------------------------------------------------

# IMAGE PROCESSING

mkdir -p "$PROCESS_DIR/$PREFIX"
for FN in $@; do
  if ! [[ -e $FN ]]; then
    echo "WARNING: $FN does not exist" >> /dev/stderr
    continue
  fi

  OUTPUT_FN=$(basename "$FN")
  PADDED_IMAGE_FN="$PROCESS_DIR/$PREFIX-step1-$OUTPUT_FN"
  BLEED_CORE_BG_FN="$PROCESS_DIR/$PREFIX-step2-$OUTPUT_FN"
  FINAL_IMAGE_FN="$PREFIX$OUTPUT_FN"

  echo "Processing: $FN ⇒ $FINAL_IMAGE_FN"

  # Expand the canvas size of the original image and feather the edges
  convert "$FN" \
    -gravity center -background transparent -extent "$CANVAS_SIZE" -alpha set \
    -virtual-pixel transparent -channel A -blur 0x6  -level 50,100% \
    "$PADDED_IMAGE_FN"

  # Generate the bleed background
  for sigma in  64 32 16 8 4 2 1 0;  do
      convert "$PADDED_IMAGE_FN" -depth 16 -channel RGBA -blur 0x$sigma miff:-
  done | convert - -background none -flatten -alpha off -paint "$BG_BLUR" \
    "$BLEED_CORE_BG_FN"

  # Layer up all the images
  convert -gravity center \
    "$BLEED_CORE_BG_FN" "$PADDED_IMAGE_FN" -composite "$FINAL_IMAGE_FN"
done

#---------------------------------------------------------------------------------------

# CLEANUP

rm -fr "$PROCESS_DIR"
