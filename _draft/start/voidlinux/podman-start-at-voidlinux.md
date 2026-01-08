


xbps-query -Rs podman

xbps-query -Rs qemu



sudo xbps-install -Su podman

sudo xbps-install -Su qemu-img


podman machine -h

podman machine info

    machineconfigdir: /home/sam/.config/containers/podman/machine/qemu
    machineimagedir: /home/sam/.local/share/containers/podman/machine/qemu


podman machine init -h

podman machine init


podman machine start

podman machine start

```
Starting machine "podman-machine-default"
Error: could not find "gvproxy" in one of [/usr/local/libexec/podman /usr/local/lib/podman /usr/libexec/podman /usr/lib/podman].  To resolve this error, set the helper_binaries_dir key in the `[engine]` section of containers.conf to the directory containing your helper binaries.
```

sudo xbps-install -Su qemu-system-amd64


xbps-query -Rs virtiofsd

sudo xbps-install -Su virtiofsd

sudo ln -sf /usr/libexec/virtiofsd /usr/local/bin/virtiofsd

sudo ln -sf /usr/libexec/virtiofsd /usr/libexec/podman/gvproxy



podman machine start

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
