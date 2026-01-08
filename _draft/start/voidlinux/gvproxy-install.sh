#!/usr/bin/env bash




##
## ## Link
##
## * https://github.com/containers/gvisor-tap-vsock/releases/
## * https://github.com/containers/gvisor-tap-vsock/releases/tag/v0.8.7
##


wget -c https://github.com/containers/gvisor-tap-vsock/releases/download/v0.8.7/gvproxy-linux-amd64


sudo cp gvproxy-linux-amd64 /usr/local/bin/gvproxy

sudo chmod 755 /usr/local/bin/gvproxy

sudo ln -sf /usr/local/bin/gvproxy /usr/libexec/podman/gvproxy
