#!/bin/sh

die() {
	echo "$@"
	exit 1
}

test -d core -a -d extra -a -d .git || die "Execute in the ArchBSD git repository's root directory"

echo "Status as of: `date`"
echo

maxcore=`ls core | wc -l`
maxextra=`ls extra | wc -l`

core=`grep portsdir core/*/PKGBUILD | awk '{ print(substr($1,1,length($1)-10)) }'`
extra=`grep portsdir extra/*/PKGBUILD | awk '{ print(substr($1,1,length($1)-10)) }'`

cntcore=$(echo "$core" | wc -l)
cntextra=$(echo "$extra" | wc -l)

echo "There are:"
echo "${cntcore} [core]  Ports-Packages out of ${maxcore} total"
echo "                 Done: " $(echo "100 - ($cntcore * 100) / $maxcore" | bc)"%"
echo "${cntextra} [extra] Ports-Packages out of ${maxextra} total"
echo "                 Done: " $(echo "100 - ($cntextra * 100) / $maxextra" | bc)"%"
echo "That's a total of "$((cntcore + cntextra))" Ports-PKGBUILDs which need to be converted on this branch."
echo "There are a total of "$((maxcore + maxextra))" packages."
echo "The total conversion progress is: "$(echo "100 - ($cntcore + $cntextra) * 100 / ($maxcore + $maxextra)" | bc)"%"
echo
echo "Here's the TODO:"
echo "$core" | sed -e 's/^/    /'
echo "$extra" | sed -e 's/^/    /'
