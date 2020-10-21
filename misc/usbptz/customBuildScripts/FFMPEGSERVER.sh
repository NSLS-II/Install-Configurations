rm -rf vendor/ffmpeg*
rm -rf vendor/yasm*
VERSION="ffmpeg-4.0.2"
SOURCE="https://ffmpeg.org/releases/${VERSION}.tar.xz"
YASM="http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz"

for z in $SOURCE $YASM; do
    wget -P vendor $z
done

tar Jxvf vendor/$(basename $SOURCE) -C vendor
tar xvf vendor/$(basename $YASM) -C vendor

rm vendor/*.xz
rm vendor/*.gz

mv vendor/$VERSION vendor/ffmpeg
mv vendor/yasm-1.2.0 vendor/yasm

make -sj

