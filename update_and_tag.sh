#!/bin/bash

echo "Grabbing most recent ADCore tag version..."
# Need to add command to get most recent ADCore tag
ADCORE_VERSION=($(git -c http.proxy=http://proxy:8888 ls-remote --tags https://github.com/areaDetector/ADCore | awk -F/ '{ print $3 }' | tac))

echo "Grabbing installSynApps..."
git clone https://github.com/epicsNSLS2-deploy/installSynApps

cd installSynApps

echo "Updating version numbers. This May take a while..."

for d in ../*/ ; do
  if [ "$d" != "installSynApps" ];
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
git commit -m "Update tags for ADCore version $ADCORE_VERSION."
git tag $ADCORE_VERSION
echo "Pushing changes and new tag."
git push origin master
git push origin --tags
echo "Done. New tag version: $ADCORE_VERSION."

else

echo "Tags updated, done."

fi
