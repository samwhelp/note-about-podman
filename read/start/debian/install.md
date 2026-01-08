---
title: 入門 / Podman / Debian / 安裝
nav_order: 1010
has_children: false
parent: 入門 / Podman / Debian
grand_parent: 入門
---


# 入門 / Podman / Debian / 安裝




## 主題

* [安裝](#安裝)
* [版本](#版本)
* [接下來](#接下來)




## 安裝

執行下面指令，安裝相關套件。

``` sh
sudo apt-get install podman qemu-utils qemu-system-x86 gvproxy virtiofsd
```

執行下面指令，建立相關的軟連結。

``` sh
sudo ln -sf /usr/bin/gvproxy /usr/libexec/podman/gvproxy

sudo ln -sf /usr/libexec/virtiofsd /usr/libexec/podman/virtiofsd
```

執行下面指令，確認相關的軟連結，是否建立成功。

``` sh
file /usr/libexec/podman/gvproxy

file /usr/libexec/podman/virtiofsd
```

顯示

```
/usr/libexec/podman/gvproxy: symbolic link to /usr/bin/gvproxy
/usr/libexec/podman/virtiofsd: symbolic link to /usr/libexec/virtiofsd
```




## 版本

執行

``` sh
podman --verison
```

顯示

```
podman version 5.4.2
```




## 接下來

> 接下來，了解「[machine的入門操作](https://samwhelp.github.io/note-about-podman/read/start/common-control/machine.html)」。

