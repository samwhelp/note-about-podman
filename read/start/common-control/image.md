---
title: 入門 / Podman / 入門操作 / image
nav_order: 1020
has_children: false
parent: 入門 / Podman / 入門操作
grand_parent: 入門
---


# 入門 / Podman / 入門操作 / image




## 主題

* [pull](#pull)
* [相關設定檔](#相關設定檔)
* [list](#list)
* [Dockerfile](#dockerfile)
* [build](#build)
* [run](#run)
* [mount](#mount)
* [rm](#rm)




## pull

執行

``` sh
podman image pull archlinux
```

顯示

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




## 相關設定檔

| 相關設定檔 |
| --------- |
| [/etc/containers/registries.conf](https://github.com/samwhelp/note-about-podman/blob/gh-pages/_demo/sample/config/debian/etc/containers/registries.conf) |
| [/etc/containers/registries.conf.d/shortnames.conf](https://github.com/samwhelp/note-about-podman/blob/gh-pages/_demo/sample/config/debian/etc/containers/registries.conf.d/shortnames.conf) (Debian) |

執行下面指令，觀看「`/etc/containers/registries.conf`」這個檔案的內容。

``` sh
cat /etc/containers/registries.conf
```

執行下面指令，觀看「`/etc/containers/registries.conf.d/shortnames.conf`」這個檔案的內容。

``` sh
cat /etc/containers/registries.conf.d/shortnames.conf
```




## list

執行

``` sh
podman images
```

或是執行

``` sh
podman image list
```

顯示

```
REPOSITORY                   TAG         IMAGE ID      CREATED     SIZE
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago  535 MB
```




## Dockerfile

執行下面指令，產生「`into.txt`」這個檔案。

``` sh
echo 'test' > info.txt
```

執行下面指令，產生「`Dockerfile`」這個檔案。

``` sh
cat << __EOL__ > Dockerfile
From alpine

COPY info.txt /info.txt

CMD cat /info.txt
__EOL__
```




## build

上面產生完「`Dockerfile`」後，接著執行下面指令，產生「`image`」

``` sh
podman build -t demo-image .
```

顯示

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




執行

``` sh
podman images
```

顯示

```
REPOSITORY                   TAG         IMAGE ID      CREATED         SIZE
localhost/demo-image         latest      82cceb175aed  29 seconds ago  8.73 MB
docker.io/library/archlinux  latest      eddb1ff8c1c6  2 days ago      535 MB
docker.io/library/debian     latest      ba695bc5c414  10 days ago     124 MB
docker.io/library/alpine     latest      e7b39c54cdec  3 weeks ago     8.74 MB
```




## run

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

顯示

```
test
```




run in interactive mode

``` sh
podman run -it --rm --name myarch archlinux
```




## mount

先執行

``` sh
podman unshare
```

接著執行下面指令，會掛載「`demo-image`」，掛載的路徑，會儲存到「`mnt_dir_path`」這個變數。

``` sh
mnt_dir_path=$(podman image mount demo-image)
```

接著執行下面指令，就可以觀看該目錄下的內容。

``` sh
ls -1 $mnt_dir_path
```

顯示

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

接著執行下面指令，離開。(注：因為上面執行`podman unshare`會進到一個新環境)

``` sh
exit
```

> 相關範例：[demo-copy-image-content](https://github.com/samwhelp/note-about-podman/tree/gh-pages/_demo/image-control/demo-copy-image-content)




## rm

run to remove image by id (783fdc4962b9)

``` sh
podman image rm -f 82cceb175aed
```
