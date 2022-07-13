#!/bin/sh

## Parameters

gh_action_path="$1"
spritepack_path="$2"

if [ -z "$spritepack_path" ]; then
    spritepack_path="."
fi


## Directory structure

mas="$gh_action_path/mas"
renpy="$gh_action_path/renpy"


## Checks run

find "$spritepack_path" \
    -type d \
    \( -path "*/game" -o \
    -path "*/mod_assets" -o \
    -path "*/characters" \) \
    -prune \
    -exec sh -c 'cd "$(dirname "$0")"; cp -r "$(basename "$(printf "%s" "$0" | sed "s/game\/mod_assets$/game/")")" "$1"' \{\} "$mas" \;

"$renpy/renpy.sh" "$mas" compile >/dev/null 2>&1
tail -n +9 "$mas/log/spj.log" | grep '^.*!ERROR! T_T.*$'

if tail -n +9 "$mas/log/spj.log" | grep -Eq '^.*!ERROR! T_T.*$'; then exit 1; fi