#!/bin/bash

if [[ $# != 1 ]]; then
	echo "Usage: $0 [deb file]"
	exit 1
fi

DEBFILE=$1

if [[ ! -f $DEBFILE ]]; then
	echo "$DEBFILE not found"
	exit 1
fi


TEMP=`mktemp -d`

deb-extractor $DEBFILE $TEMP


FOLDER=`basename $DEBFILE | sed 's/\.deb//'`

mkdir -p $FOLDER/DEBIAN


tar -xvf $TEMP/data.tar.xz -C $FOLDER 
tar -xvf $TEMP/control.tar.xz -C $FOLDER/DEBIAN



