#!/bin/sh
set -u

file=$1

mime=$(file -Lbi -- "$file")
char=${mime##*=}
mime=${mime%%;*}

if [ "$char" != binary ]; then
    cat -- "$file"
    exit
fi

echo '----- File Type Classification -----'
file -Lb -- "$file" | sed 's/, /\n/g'
echo '------------------------------------'
echo

try() {
    "$@" -- "$file" 2>/dev/null && exit
}

case "$mime" in
    application/*)
        case "${mime##*/}" in
            zip|rar|gzip)
                try als
                break ;;
        esac
        break ;;
    image/* | video/* | audio/*)
        try mediainfo
        break ;;
esac
