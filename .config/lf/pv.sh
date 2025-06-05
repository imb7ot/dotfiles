#!/bin/sh

file=$1

filetype=$(file -Lbi -- "$file")
mime=${filetype%%;*}
charset=${filetype##*=}

locale=${LC_ALL:-${LC_CTYPE:-$LANG}}

if [ "$charset" = 'us-ascii' ] ||
    { case "$locale" in *UTF-8*);; *) false;; esac &&
    [ "$charset" = 'utf-8' ]; }; then
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
            x-tar|gzip|zstd|zip|x-7z-compressed|vnd.rar)
                bsdtar -tf "$file" 2>/dev/null && exit
                break ;;
        esac
        break ;;
    image/* | video/* | audio/*)
        try mediainfo
        break ;;
esac
