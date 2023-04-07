Tailscale derper
================


This is a simple container that runs a [custom DERP server](https://tailscale.com/kb/1118/custom-derp-servers/).

## Usage

```
$ podman run -d             \
    --name tailscale-derper \
    --restart=always        \
    -p 80:80                \
    -p 443:443              \
    -p 3478:3478/udp        \
    -v /var/run/tailscale/tailscaled.sock:/var/run/tailscale/tailscaled.sock \
    ghcr.io/spotsnel/tailscale-derper:latest \
    --a :443                \
    --hostname derp.my.com  \
    --verify-clients=true
$ podman logs -f tailscale-derper
```

Consider using a volume for the certs: `-v /data/derper-certs:/.cache/tailscale/derper-certs `
