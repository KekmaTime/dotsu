#!/bin/bash

DEST_DIR="/home/damon/Downloads"

mkdir -p "$DEST_DIR/images" "$DEST_DIR/videos" "$DEST_DIR/documents" "$DEST_DIR/archives" "$DEST_DIR/audio" "$DEST_DIR/others"

for file in "$DEST_DIR"/*; do
    if [[ -f "$file" ]]; then
        case "$file" in
            *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.tiff|*.webp|*.svg) 
                mv "$file" "$DEST_DIR/images/"
                ;;
            *.mp4|*.mkv|*.mov|*.avi|*.flv|*.wmv)
                mv "$file" "$DEST_DIR/videos/"
                ;;
            *.pdf|*.doc|*.docx|*.txt|*.odt)
                mv "$file" "$DEST_DIR/documents/"
                ;;
            *.zip|*.tar|*.gz|*.bz2|*.rar|*.7z)
                mv "$file" "$DEST_DIR/archives/"
                ;;
            *.mp3|*.wav|*.flac|*.aac|*.ogg)
                mv "$file" "$DEST_DIR/audio/"
                ;;
            *)
                mv "$file" "$DEST_DIR/others/"
                ;;
        esac
    fi
done
