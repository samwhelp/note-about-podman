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
| `/etc/containers/registries.conf` |
| `/etc/containers/registries.conf.d/shortnames.conf` (Debian) |

執行下面指令，觀看「`/etc/containers/registries.conf`」這個檔案的內容。

``` sh
cat /etc/containers/registries.conf
```

執行下面指令，觀看「`/etc/containers/registries.conf.d/shortnames.conf`」這個檔案的內容。

``` sh
cat /etc/containers/registries.conf.d/shortnames.conf
```
