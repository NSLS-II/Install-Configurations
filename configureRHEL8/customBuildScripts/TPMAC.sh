
echo "Adding pmacAsynCoordSrc to pmacApp Makefile..."
sed -i '/^DIRS += pmacAsynMotorSrc/a DIRS += pmacAsynCoordSrc' pmacApp/Makefile

make -s
