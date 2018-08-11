#
##################################
# Gr2_srk  <gr2.stark@gmail.com> #	
# HB72K    <ghettoxx2@gmail.com> #	
#           Build kernel         #
##################################
#

#!/bin/bash

#Inicio
echo ''
echo "======================"
echo ''
echo " Demoniac-Team"
echo ''
echo "======================"
echo ''

#LINARIO
echo ""
echo ""
LIN=~/arm-linux-androideabi-4.9
echo ""
echo ""
if [ ! -d "$LIN" ]; then
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
echo ''
echo "***Verificando Linario...***"
echo ''
fi
sleep 1s 
echo ''
echo ''
LIN=~/arm-cortex_a7-linux-gnueabihf-linaro_4.9
if [ ! -d "$LIN" ]; then
git clone https://github.com/Christopher83/arm-cortex_a7-linux-gnueabihf-linaro_4.9.git 
echo "***Se usará Linario existente***"
echo ''
fi
sleep 1s 
echo ''
echo ''
#Compilacion
make clean && make mrproper
echo ''
echo '==================================='
echo ''
echo 'Compilando Kernel con Linario'
echo ''
echo '==================================='
make ARCH=arm mt6737t-grandpplte_defconfig
make -j5 ARCH=arm CROSS_COMPILE=~/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
echo ''
echo ''
eval echo "~$USER" 
echo ''
cp arch/arm/boot/zImage '/home/$USER/kernel'
find . -name '*ko' -exec cp '{}' '/home/$USER/kernel' \;

#FIN
echo ''
echo '========================================='
echo ''
echo 'Compilacion terminada, Felicidades'
echo ''
echo '========================================='
echo ''
sleep 10s
