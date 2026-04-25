#!/bin/bash
ytd() {

if [ -z "$1" ]; then
        echo "Usage: ytd filename.txt"
        return 1
    fi

yt-dlp -x \
--audio-format mp3 \
--audio-quality 0 \
--cookies-from-browser firefox \
--embed-metadata \
--embed-thumbnail \
--add-metadata \
--batch-file "$1" \
-o "/persist/home/ranger/Music/%(title)s.%(ext)s"
}
