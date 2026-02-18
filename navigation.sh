#!/usr/bin/env bash

marco() {
	echo "$PWD" > ~/.marco_location
	echo "Saved current directory"
}

polo() {
	if [[ ! -f ~/.marco_location ]]; then
		echo "Polo called before marco"
		return 1
	fi

	dir=$(cat ~/.marco_location)
	cd "$dir" || return 1
}
