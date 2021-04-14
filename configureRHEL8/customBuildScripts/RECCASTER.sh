
rm -rf .github
rm -rf debian
rm -rf server
rm .*
rm COPYRIGHT LICENSE README.md test-client.py

mv client/* .
rmdir client

sed -i 's/#EPICS_BASE=\/path\/to\/epics-base/EPICS_BASE=\/epics\/src\/base/g' configure/RELEASE

make -sj



