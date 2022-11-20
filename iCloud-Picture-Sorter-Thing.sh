#!/bin/bash

for i in `ls *.HEIC` ;
do
        DATEZ=`exiftool -EXIF:DateTimeOriginal $i | awk -F":" '{print $2 $3}' | xargs`
        echo $DATEZ
        if [ -d $DATEZ ]
        then
                echo "Directory $DATEZ exists."
        else
                mkdir $DATEZ
        fi
        mv $i $DATEZ
        mv `echo $i | awk -F"." '{ print $1".MOV"}'` $DATEZ

done

