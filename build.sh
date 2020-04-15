#!/bin/sh -l

#searchword='non-e2e'

# Check if last commit has the tag $(searchword). THis grep is more strong than grep -w
#git describe --tags $(git rev-parse --short HEAD) | grep -E "^$searchword\s|\s($searchword)\s|\s$searchword$|^$searchword$"

echo "Running test $1 on cloud $2"
