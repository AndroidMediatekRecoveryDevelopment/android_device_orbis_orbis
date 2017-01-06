cd ~/cm11
make clean
source build/envsetup.sh
lunch cm_orbis-eng
mka -j4 recoveryimage
