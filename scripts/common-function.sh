#!/bin/sh

function hasFile() {
    local result="false"
    if [[ "${1}" && -e "${1}" ]]; then
        result="true"
    fi
    echo "$result"
}
function hasDir() {
    local result="false"
    if [[ "${1}" ]]; then
        if [ -d "${1}" ]; then
            result="true"
        fi
    fi
    echo "$result"
}

# file -usage
# ./scripts/common-function.sh
