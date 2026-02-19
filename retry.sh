#!/usr/bin/env bash

if [[ -z "$1" ]]; then
	echo "Usage $0: <script>"
	exit 1
fi

count=0
start=$(date +%s%N)

while true; do
	count=$((count+1))

	$1 > stdout.log 2> stderr.log
	result=$?

	if [[ $result -eq 0 ]]; then
		echo "Run $count: success"
	else
		echo "Run $count: FAILED"
		break
	fi
done

end=$(date +%s%N)
duration=$(((end-start) / 100000000))

echo "Statistics:"
echo "- Successful runs: $((count-1))"
echo "Failed on run: $count"
echo "Total time: $((duration/10)).$((duration%10)) seconds"
echo ""
echo "Error output:"
cat stderr.log
echo ""
echo "Standard output from failed run:"
cat stdout.log
