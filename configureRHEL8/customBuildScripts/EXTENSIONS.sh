echo "Building extensions with just make instead of make -sj to avoid bizzare error"

echo "Adding EDM to the extensions Makefile..."
sed -i '/^MEDM = medm/a EDM = edm' src/Makefile
sed -i '/^DIRS += $(MEDM)/a DIRS += $(EDM)' src/Makefile


make -s
