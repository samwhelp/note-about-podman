---
title: 入門 / Podman / 入門操作 / machine
nav_order: 1010
has_children: false
parent: 入門 / Podman / 入門操作
grand_parent: 入門
---


# 入門 / Podman / 入門操作 / machine




## 主題

* [init](#init)
* [start](#start)
* [stop](#stop)
* [閱讀指令用法](#閱讀指令用法)
* [info](#info)
* [接下來](#接下來)




## init

執行

``` sh
podman machine init
```

顯示

```
Looking up Podman Machine image at quay.io/podman/machine-os:5.4 to create VM
Extracting compressed file: podman-machine-default-amd64.qcow2: done
Image resized.
Machine init complete
To start your machine run:

	podman machine start
```




## start

執行

``` sh
podman machine set --rootful
```


接著執行

``` sh
podman machine start
```

顯示

```
Starting machine "podman-machine-default"
Mounting volume... /home/sam:/home/sam
API forwarding listening on: /run/user/1000/podman/podman-machine-default-api.sock
You can connect Docker API clients by setting DOCKER_HOST using the
following command in your terminal session:

        export DOCKER_HOST='unix:///run/user/1000/podman/podman-machine-default-api.sock'

Machine "podman-machine-default" started successfully
```




## stop

執行

``` sh
podman machine stop
```

顯示

```
Waiting for VM to exit...
Machine "podman-machine-default" stopped successfully
```




## 閱讀指令用法

執行

``` sh
podman machine -h
```

或是執行

``` sh
podman machine --help
```

顯示

``` sh
Manage a virtual machine

Description:
  Manage a virtual machine. Virtual machines are used to run Podman.

Usage:
  podman machine [command]

Available Commands:
  info        Display machine host info
  init        Initialize a virtual machine
  inspect     Inspect an existing machine
  list        List machines
  os          Manage a Podman virtual machine's OS
  reset       Remove all machines
  rm          Remove an existing machine
  set         Set a virtual machine setting
  ssh         SSH into an existing machine
  start       Start an existing machine
  stop        Stop an existing machine


```

也可以閱讀子命令的用法，舉例

``` sh
podman machine info -h
```

顯示

```
Display machine host info

Description:
  Display information pertaining to the machine host.

Usage:
  podman machine info [options]

Examples:
  podman machine info

Options:
  -f, --format string   Change the output format to JSON or a Go template

```




## info

執行

``` sh
podman machine info
```

顯示

```
host:
    arch: amd64
    currentmachine: podman-machine-default
    defaultmachine: ""
    eventsdir: /run/user/1000/podman
    machineconfigdir: /home/sam/.config/containers/podman/machine/qemu
    machineimagedir: /home/sam/.local/share/containers/podman/machine/qemu
    machinestate: Running
    numberofmachines: 1
    os: linux
    vmtype: qemu
version:
    apiversion: 5.4.2
    version: 5.4.2
    goversion: go1.24.4
    gitcommit: ""
    builttime: Sat Jul 26 05:23:06 2025
    built: 1753478586
    buildorigin: Debian
    osarch: linux/amd64
    os: linux

```




## 接下來

