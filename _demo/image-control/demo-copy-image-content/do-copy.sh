#!/usr/bin/env bash




rootfs_dir_path="tmp/rootfs"




##
## ## prepare des dir
##

mkdir -p "${rootfs_dir_path}"




##
## ## mount image
##

mnt_dir_path=$(podman image mount demo-image)




##
## ## copy image content via rsync
##

rsync -av "${mnt_dir_path}/" "${rootfs_dir_path}/"




##
## ## check
##

echo
echo ls "${rootfs_dir_path}"
echo
ls "${rootfs_dir_path}"
echo
