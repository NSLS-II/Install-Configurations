#!/bin/bash

# If running behind a proxy, edit this variable to be -c http.proxy=YOUR_PROXY
GIT_PROXY=""

echo "Grabbing most recent ADCore tag version..."
git $GIT_PROXY clone --quiet https://github.com/areaDetector/ADCore
cd ADCore
ADCORE_VERSION=$(git describe --abbrev=0 --tags )
cd ..
rm -rf ADCore

# Need to add command to get most recent ADCore tag
echo "Grabbing installSynApps..."
git clone https://github.com/epicsNSLS2-deploy/installSynApps

cd installSynApps

echo "Updating version numbers. This may take a while..."

for d in ../*/
do
  if [ "$d" != "../installSynApps/" ];
  then
    echo
    python3 -u installCLI.py -c $d -v
  fi
done

cd ..
rm -rf installSynApps

read -e -p "Would you like to tag, commit, and push updated tags? (y/n) > " UPDATE

if [ "$UPDATE" == "y" ];
then

echo "Finished updating version numbers. Creating Install-Configurations tag..."
git add -A
git commit -m "Mass update tags for ADCore version $ADCORE_VERSION."
git tag $ADCORE_VERSION
echo "Pushing changes and new tag."
git push origin master
git push origin --tags
echo "Done. New tag version: $ADCORE_VERSION."

else

echo "Tags updated, done."

fi
