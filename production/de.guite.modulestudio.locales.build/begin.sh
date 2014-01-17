#!/bin/sh
WORKSPACE=$1
echo "Linking project git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-0_Fetch-1_Product/workspace/scm "$WORKSPACE/refProduct"

echo "Linking meta model git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-1_Fetch-2_MetaModel/workspace/scm "$WORKSPACE/refMetaModel"

echo "Linking textual git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-1_Fetch-3_TextualEditor/workspace/scm "$WORKSPACE/refTextual"

echo "Linking graphical git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-1_Fetch-5_Editors/workspace/scm "$WORKSPACE/refEditors"

echo "Linking generator git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-1_Fetch-4_Generator/workspace/scm "$WORKSPACE/refGenerator"

echo "Linking help git repository"
ln -sfT /var/lib/jenkins/jobs/MOST-1_Fetch-8_Help/workspace/scm "$WORKSPACE/refHelp"
