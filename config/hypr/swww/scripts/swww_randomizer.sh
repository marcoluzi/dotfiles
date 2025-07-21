#!/bin/sh
# Changes the wallpaper to a randomly chosen image from ~/pictures/wallpapers
# at a set interval.

DEFAULT_INTERVAL=20 # In seconds
WALLPAPER_DIR="$HOME/pictures/wallpapers"

# Allow optional interval as argument
INTERVAL="${1:-$DEFAULT_INTERVAL}"
if ! [ "$INTERVAL" -eq "$INTERVAL" ] 2>/dev/null; then
    echo "Usage: $0 [INTERVAL]"
    echo "Error: Interval must be a number."
    exit 1
fi

# Validate that the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory '$WALLPAPER_DIR' does not exist."
    exit 1
fi

# swww settings
RESIZE_TYPE="crop"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION_STEP="${SWWW_TRANSITION_STEP:-2}"

trap 'echo "Exiting..."; exit 0' SIGINT SIGTERM

while true; do
    img=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.bmp' -o -iname '*.webp' \) | shuf -n 1)

    if [ -n "$img" ]; then
        echo "Setting wallpaper: $img"
        swww img --resize="$RESIZE_TYPE" "$img"
    else
        echo "No images found in $WALLPAPER_DIR."
    fi

    sleep "$INTERVAL"
done
