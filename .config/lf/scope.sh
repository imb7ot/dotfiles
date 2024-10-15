#!/bin/sh
set -u

file=$1
width=$2
height=$3

mime=$(file -Lb --mime-type -- "$file")

sixel() {
    chafa -f sixel --passthrough none --polite on -s "${width}x$height" -- "$1"
}

try() {
    "$@" -- "$file" && exit 0
}

case "$mime" in
    text/*)
        try cat
        break ;;
    application/*)
        case "${mime##*/}" in
            zip|rar|gzip)
                try als
                break ;;
            json)
                try jq .
                try cat
                break ;;
        esac
        break ;;
    image/*)
        try sixel "$file"
        break ;;
    video/* | audio/*)
        try mediainfo -- "$file"
        break ;;
esac

echo '----- File Type Classification -----'
file -Lb -- "$file" | sed 's/, /\n/g'
echo "$mime"
