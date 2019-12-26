#!/bin/bash

echo "Grabbing most recent ADCore tag version..."
# Need to add command to get most recent ADCore tag
#ADCORE_VERSION=$(git ls-remote )

echo "Grabbing installSynApps..."
git clone https://github.com/epicsNSLS2-deploy/installSynApps

cd installSynApps

echo "Updating version numbers. This May take a while..."

for d in ../*/ ; do
  if [ "$d" != "installSynApps" ];
  then
    python3 -u installCLI.py -c ../$d -v
  fi
done

echo "Finished updating version numbers. Creating Install-Configurations tag..."
git add -A
git commit -m "Update tags for ADCore version $ADCORE_VERSION."
git tag $ADCORE_VERSION
echo "Pushing changes and new tag."
git push origin master
git push origin --tags
echo "Done. New tag version: $ADCORE_VERSION."
