#!/bin/bash

echo "Starting translation pack job"
INPUTPATH="${GITHUB_WORKSPACE}/components/"
BASEFOLDER="MostTranslationPack"
OUTPUT_FOLDER="${BASEFOLDER}/output"
OUTPUT_FEATURES="${OUTPUT_FOLDER}/features.properties"
OUTPUT_PLUGINS="${OUTPUT_FOLDER}/plugins.properties"
OUTPUT_ARCHIVE="${BASEFOLDER}/MOST-translation-pack.zip"
echo "Creating output artifacts"
mkdir -p $OUTPUT_FOLDER
touch $OUTPUT_FEATURES
touch $OUTPUT_PLUGINS

echo "Starting with processing feature bundles"
for CURRENTFILE in `find -L $INPUTPATH -type f -iname 'feature.properties' -not -path "*/target/*" -not -path "*.nl1.*/*" -not -path "*@script/*"`
do
    echo "\n\n# Properties from $CURRENTFILE:\n" >> $OUTPUT_FEATURES
    cat $CURRENTFILE >> $OUTPUT_FEATURES
done
echo "Feature properties collected and written"

echo "Starting with processing plugin bundles"
for CURRENTFILE in `find -L $INPUTPATH -type f -iname 'bundle.properties' -not -path "*/com.jre.oracle*/*" -not -path "*/target/*" -not -path "*.nl1.*/*" -not -path "*@script/*"`
do
    echo "Adding $CURRENTFILE"
    echo "\n\n# Properties from $CURRENTFILE\n" >> $OUTPUT_PLUGINS
    cat $CURRENTFILE >> $OUTPUT_PLUGINS
done
for CURRENTFILE in `find -L $INPUTPATH -type f -iname 'plugin.properties' -not -path "*/target/*" -not -path "*.nl1.*/*" -not -path "*@script/*"`
do
    echo "Adding $CURRENTFILE"
    echo "\n\n# Properties from $CURRENTFILE\n" >> $OUTPUT_PLUGINS
    cat $CURRENTFILE >> $OUTPUT_PLUGINS
done
for CURRENTFILE in `find -L $INPUTPATH -type f -iname '*messages.properties' -not -path "*/target/*" -not -path "*.nl1.*/*" -not -path "*@script/*"`
do
    echo "Adding $CURRENTFILE"
    echo "\n\n# Properties from $CURRENTFILE\n" >> $OUTPUT_PLUGINS
    cat $CURRENTFILE >> $OUTPUT_PLUGINS
done
echo "Plugin properties collected and written"

echo "Collecting help files"
mkdir -p $OUTPUT_FOLDER/help
for CURRENTFILE in `find -L $INPUTPATH -type f -iname '*.md' -not -name "README.md"`
do
     cp $CURRENTFILE $OUTPUT_FOLDER/help
done
echo "Included help files"

echo "Archiving output folder"
rm -f $OUTPUT_ARCHIVE
zip -r $OUTPUT_ARCHIVE $OUTPUT_FOLDER/*
echo "Results archived in $OUTPUT_ARCHIVE"

rm -r $OUTPUT_FOLDER
echo "Cleanup done, job completed"
