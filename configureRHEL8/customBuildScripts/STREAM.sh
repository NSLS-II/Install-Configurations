make -sj


mkdir dbd
mkdir db
mkdir lib
mkdir lib/linux-x86_64
mkdir bin
mkdir bin/linux-x86_64

# Copy dbd and libs because for some reason just make doesn't install them properly
cp src/O.*/*.dbd dbd/.
cp src/O.linux-x86_64/libstream.* lib/linux-x86_64/.


# Build again, to make sure that it built OK the first time
make -sj

