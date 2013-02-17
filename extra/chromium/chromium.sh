#!/usr/local/bin/bash

# Allow users to override command-line options
# Based on Gentoo's chromium package (and by extension, Debian's)
if [[ -f /usr/local/etc/chromium/default ]]; then
	. /usr/local/etc/chromium/default
fi

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromium/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP=chromium.desktop

exec /usr/local/lib/chromium/chromium $CHROMIUM_FLAGS "$@"
