#!/usr/bin/env bash

[ -z "$PS1" ] && return

# environment
export PS4='\033[90m+${BASH_SOURCE##*/}:${LINENO}: ${FUNCNAME:+$FUNCNAME: }\033[0m'

. ~/.aliases
