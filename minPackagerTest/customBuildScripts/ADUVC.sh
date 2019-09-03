
echo "Inside ############################"
cd adUVCSupport
git clone https://github.com/libuvc/libuvc
cd libuvc
mkdir build
cd build
cmake ..
make
mkdir ../../os
mkdir ../../os/linux-x86_64
cp *.so* ../../os/linux-x86_64/.
cd ../..
rm -rf libuvc
cd ..
make -sj
echo "##################################"

