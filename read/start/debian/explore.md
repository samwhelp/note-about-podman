---
title: 如何在「Debian」，安裝「Podman」的初探紀錄
nav_order: 1020
has_children: false
parent: 入門 / Podman / Debian
grand_parent: 入門
---


# 如何在「Debian」，安裝「Podman」的初探紀錄






# podman-start-at-debian


## podman


### podman / search

``` sh
apt-cache search podman
```


### podman / install

``` sh
sudo apt-get install podman
```


### podman / version

run

``` sh
podman --version
```

show

```
podman version 5.4.2
```




## machine

### machine / init / qemu-img missing

run

```
podman machine init
```

show

```
Looking up Podman Machine image at quay.io/podman/machine-os:5.4 to create VM
Getting image source signatures
Copying blob d982f2a01613 done   |
Copying config 44136fa355 done   |
Writing manifest to image destination
d982f2a01613fbd566d81266a619f7bad958268def3a3f924a8e209f48578d75
Extracting compressed file: podman-machine-default-amd64.qcow2: done
Error: exec: "qemu-img": executable file not found in $PATH
````




## qemu-img


### qemu-img / install

run

``` sh
apt-cache search qemu-img
```

show

```
qemu-block-extra - extra block backend modules for qemu-system and qemu-utils
qemu-utils - QEMU utilities
```

run

``` sh
sudo apt-get install qemu-utils
```




### machine / init / success

run

``` sh
podman machine init
```

show

```
Looking up Podman Machine image at quay.io/podman/machine-os:5.4 to create VM
Extracting compressed file: podman-machine-default-amd64.qcow2: done
Image resized.
Machine init complete
To start your machine run:

	podman machine start
```


### machine / start / gvproxy missing

run

``` sh
podman machine start
```

show

```
Starting machine "podman-machine-default"
Error: could not find "gvproxy" in one of [/usr/local/libexec/podman /usr/local/lib/podman /usr/libexec/podman /usr/lib/podman].  To resolve this error, set the helper_binaries_dir key in the `[engine]` section of containers.conf to the directory containing your helper binaries.
```




## gvproxy

### gvproxy / search

run

``` sh
apt-cache search gvproxy
```

show

```
gvproxy - Secure networking stack for container runtimes (program)
```


### gvproxy / install

run

``` sh
sudo apt-get install gvproxy
```

### gvproxy / install / link

run

``` sh
sudo ln -sf /usr/bin/gvproxy /usr/libexec/podman/gvproxy
```

or run

``` sh
sudo ln -sf $(which gvproxy) /usr/libexec/podman/gvproxy
```

check

``` sh
file /usr/libexec/podman/gvproxy
```

show

```
/usr/libexec/podman/gvproxy: symbolic link to /usr/bin/gvproxy
```



### machine / start / qemu-system-x86_64 missing

run

``` sh
podman machine start
```

show

```
Starting machine "podman-machine-default"
Error: unable to generate qemu command line: "exec: \"qemu-system-x86_64\": executable file not found in $PATH"
```




## qemu-system


## qemu-system / search

run

``` sh
apt-cache search qemu-system
```

show

```
qemu-block-extra - extra block backend modules for qemu-system and qemu-utils
qemu-guest-agent - Guest-side qemu-system agent
qemu-system - QEMU full system emulation binaries
qemu-system-arm - QEMU full system emulation binaries (arm)
qemu-system-common - QEMU full system emulation binaries (common files)
qemu-system-data - QEMU full system emulation (data files)
qemu-system-gui - QEMU full system emulation binaries (graphical display and audio modules)
qemu-system-mips - QEMU full system emulation binaries (mips)
qemu-system-misc - QEMU full system emulation binaries (miscellaneous)
qemu-system-modules-opengl - QEMU full system emulation binaries (OpenGL display modules)
qemu-system-modules-spice - QEMU full system emulation binaries (spice display modules)
qemu-system-ppc - QEMU full system emulation binaries (ppc)
qemu-system-riscv - QEMU full system emulation binaries (riscv)
qemu-system-s390x - QEMU full system emulation binaries (s390x)
qemu-system-sparc - QEMU full system emulation binaries (sparc)
qemu-system-x86 - QEMU full system emulation binaries (x86)
qemu-system-xen - QEMU full system emulation (Xen helper package)
```




## qemu-system-x86

### qemu-system-x86 / install

``` sh
sudo apt-get install qemu-system-x86
```




### machine / start / virtiofsd missing


run

``` sh
podman machine start
```

show

``` sh
Starting machine "podman-machine-default"
ERRO[0000] process 10473 has not ended
Error: failed to find virtiofsd: exec: "virtiofsd": executable file not found in $PATH
```



## virtiofsd

### virtiofsd / search

run

``` sh
apt-cache search virtiofsd
```

show

```
librust-virtiofsd-dev - Virtio-fs vhost-user device daemon - Rust source code
virtiofsd - Virtio-fs vhost-user device daemon
```


### virtiofsd / install

run

``` sh
sudo apt-get install virtiofsd
```


run

``` sh
dpkg -L virtiofsd
```

show

```
/.
/usr
/usr/lib
/usr/lib/qemu
/usr/libexec
/usr/libexec/virtiofsd
/usr/share
/usr/share/doc
/usr/share/doc/virtiofsd
/usr/share/doc/virtiofsd/README.md.gz
/usr/share/doc/virtiofsd/changelog.Debian.gz
/usr/share/doc/virtiofsd/copyright
/usr/share/doc/virtiofsd/xattr-mapping.md.gz
/usr/share/qemu
/usr/share/qemu/vhost-user
/usr/share/qemu/vhost-user/50-virtiofsd.json
/usr/lib/qemu/virtiofsd
```



run

``` sh
sudo ln -sf /usr/libexec/virtiofsd /usr/libexec/podman/virtiofsd
```


check

``` sh
file /usr/libexec/podman/virtiofsd
```

show

```
/usr/libexec/podman/virtiofsd: symbolic link to /usr/libexec/virtiofsd
```


### machine / start / rootless mode / success


run

``` sh
podman machine start
```

show

```
Starting machine "podman-machine-default"

This machine is currently configured in rootless mode. If your containers
require root permissions (e.g. ports < 1024), or if you run into compatibility
issues with non-podman clients, you can switch using the following command:

	podman machine set --rootful

Mounting volume... /home/sam:/home/sam
API forwarding listening on: /run/user/1000/podman/podman-machine-default-api.sock
You can connect Docker API clients by setting DOCKER_HOST using the
following command in your terminal session:

        export DOCKER_HOST='unix:///run/user/1000/podman/podman-machine-default-api.sock'

Machine "podman-machine-default" started successfully
```




### machine / stop

run

``` sh
podman machine stop
```

show

```
Waiting for VM to exit...
Machine "podman-machine-default" stopped successfully
```




### machine / start / rootful


run

``` sh
podman machine set --rootful
```


then run

``` sh
podman machine start
```

show

```
Starting machine "podman-machine-default"
Mounting volume... /home/sam:/home/sam
API forwarding listening on: /run/user/1000/podman/podman-machine-default-api.sock
You can connect Docker API clients by setting DOCKER_HOST using the
following command in your terminal session:

        export DOCKER_HOST='unix:///run/user/1000/podman/podman-machine-default-api.sock'

Machine "podman-machine-default" started successfully
```



## image


## image / pull / archlinux

run

``` sh
podman image pull archlinux
```

show

```
Resolved "archlinux" as an alias (/etc/containers/registries.conf.d/shortnames.conf)
Trying to pull docker.io/library/archlinux:latest...
Getting image source signatures
Copying blob 73920abf4e07 done   |
Copying blob 74d5579544e6 done   |
Copying config eddb1ff8c1 done   |
Writing manifest to image destination
eddb1ff8c1c65c7a3bc3d3b2bf28d1ac30edc9ab525c1cdfaaa652c462db7c1e
```



### /etc/containers/registries.conf.d/shortnames.conf

``` sh
cat /etc/containers/registries.conf.d/shortnames.conf
```


### image / list

run

``` sh
podman image list
```

show

```
REPOSITORY                   TAG         IMAGE ID      CREATED     SIZE
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago  535 MB
```




## image / pull / debian


run

``` sh
podman image pull debian
```

show

```
Resolved "debian" as an alias (/etc/containers/registries.conf.d/shortnames.conf)
Trying to pull docker.io/library/debian:latest...
Getting image source signatures
Copying blob 281b80c799de done   |
Copying config ba695bc5c4 done   |
Writing manifest to image destination
ba695bc5c4147c86b9082686289ea1440d939badcdb839fc7f27de4673770a87
```


### images

run

``` sh
podman images
```

show

```
REPOSITORY                   TAG         IMAGE ID      CREATED      SIZE
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago   535 MB
docker.io/library/debian     latest      ba695bc5c414  10 days ago  124 MB
```


## run

### run / help

run

``` sh
podman run --help
```

show

``` sh
Run a command in a new container

Description:
  Runs a command in a new container from the given image

Usage:
  podman run [options] IMAGE [COMMAND [ARG...]]

Examples:
  podman run imageID ls -alF /etc
  podman run --network=host imageID dnf -y install java
  podman run --volume /var/hostdir:/var/ctrdir -i -t fedora /bin/bash

...

```


### run / demo / 001

run

``` sh
podman run archlinux ls -alF /etc
```




### run / demo / 002

run

``` sh
podman run archlinux cat /etc/os-release
```

show

```
NAME="Arch Linux"
PRETTY_NAME="Arch Linux"
ID=arch
BUILD_ID=rolling
VERSION_ID=20260104.0.477168
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://archlinux.org/"
DOCUMENTATION_URL="https://wiki.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues"
PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
LOGO=archlinux-logo
```


## Dockerfile

create `into.txt`

``` sh
echo 'test' > info.txt
```

create `Dockerfile`

``` sh
cat << __EOL__ > Dockerfile
From alpine

COPY info.txt /info.txt

CMD cat /info.txt
__EOL__
```



## image build

### image build / help


run

``` sh
podman image build -h
```

show

```
Build an image using instructions from Containerfiles

Description:
  Builds an OCI or Docker image using instructions from one or more Containerfiles and a specified build context directory.

Usage:
  podman image build [options] [CONTEXT]

Examples:
  podman image build .
  podman image build --creds=username:password -t imageName -f Containerfile.simple .
  podman image build --layers --force-rm --tag imageName .

...
```

### image build / demo / 001

run

``` sh
podman image build .
```

show

```
STEP 1/3: FROM alpine
Resolved "alpine" as an alias (/etc/containers/registries.conf.d/shortnames.conf)
Trying to pull docker.io/library/alpine:latest...
Getting image source signatures
Copying blob 1074353eec0d done   |
Copying config e7b39c54cd done   |
Writing manifest to image destination
STEP 2/3: COPY info.txt /info.txt
--> 2671930b5e94
STEP 3/3: CMD cat /info.txt
COMMIT
--> 783fdc4962b9
783fdc4962b90d5debf060fb26837ea1360fd29adebd2f1ed94197d7c88aa93b
```

run

``` sh
podman images
```

show

```
REPOSITORY                   TAG         IMAGE ID      CREATED         SIZE
<none>                       <none>      783fdc4962b9  29 seconds ago  8.73 MB
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago      535 MB
docker.io/library/debian     latest      ba695bc5c414  10 days ago     124 MB
docker.io/library/alpine     latest      e7b39c54cdec  3 weeks ago     8.74 MB
```

run image by id (783fdc4962b9)

``` sh
podman run 783fdc4962b9
```

show

```
test
```


run to remove image by id (783fdc4962b9)

``` sh
podman image rm -f 783fdc4962b9
```

run

``` sh
podman images
```

show

```
REPOSITORY                   TAG         IMAGE ID      CREATED      SIZE
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago   535 MB
docker.io/library/debian     latest      ba695bc5c414  10 days ago  124 MB
docker.io/library/alpine     latest      e7b39c54cdec  3 weeks ago  8.74 MB
```

### build / demo / 002

run

``` sh
podman build -t demo-image .
```

show

```
STEP 1/3: FROM alpine
STEP 2/3: COPY info.txt /info.txt
--> da727464a881
STEP 3/3: CMD cat /info.txt
COMMIT demo-image
--> 82cceb175aed
Successfully tagged localhost/demo-image:latest
82cceb175aedf11eb5ddb0d2c8750658320d35bdae28ca9f4d308f21d78d51dd
```


run

``` sh
podman images
```

show

```
REPOSITORY                   TAG         IMAGE ID      CREATED         SIZE
localhost/demo-image         latest      82cceb175aed  29 seconds ago  8.73 MB
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago      535 MB
docker.io/library/debian     latest      ba695bc5c414  10 days ago     124 MB
docker.io/library/alpine     latest      e7b39c54cdec  3 weeks ago     8.74 MB
```


run image by id (82cceb175aed)

``` sh
podman run 82cceb175aed
```


run image by name (demo-image)

``` sh
podman run demo-image
```

run image by name (localhost/demo-image)

``` sh
podman run localhost/demo-image
```




## image mount

### image mount / help

run

``` sh
podman image mount -h
```

show

```
Mount an image's root filesystem

Description:
  podman image mount
    Lists all mounted images mount points if no images is specified

  podman image mount IMAGE-NAME-OR-ID
    Mounts the specified image and prints the mountpoint


Usage:
  podman image mount [options] [IMAGE...]

Examples:
  podman image mount imgID
  podman image mount imgID1 imgID2 imgID3
  podman image mount
  podman image mount --all

Options:
  -a, --all             Mount all images
      --format string   Print the mounted images in specified format (json)
```


### image mount / error

run

``` sh
podman image mount demo-image
```

show

```
Error: cannot run command "podman image mount" in rootless mode, must execute `podman unshare` first
```



### image mount / steps

run

``` sh
podman unshare
```

then run

``` sh
mnt_dir_path=$(podman image mount demo-image)
```

then run

``` sh
ls -1 $mnt_dir_path
```

show

```
bin
dev
etc
home
info.txt
lib
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
```

then exit

``` sh
exit
```
