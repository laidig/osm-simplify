#!/bin/bash

if [ $# != 1 ]; then
    echo "./osm-simplify.sh [osm.pbf file]"
fi

echo "simplifying $1"

mkdir -p temp/

osmconvert $1 --verbose --drop-author --drop-version -o=temp/temp.o5m
osmfilter temp/temp.o5m --drop="wikipedia= wikipedia:*= contact:phone= website= url= phone= fax= email= addr:email= image= url:official= contact:website= addr:phone= phone:mobile= contact:mobile= addr:fax= contact:email= contact:fax= image:panorama= opening_hours=" --out-o5m >temp/temp-olm.o5m
osmconvert temp/temp-olm.o5m --out-pbf -o=clean.osm.pbf


rm -rf temp/
