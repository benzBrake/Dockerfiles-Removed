# benzbrake/goflyway

goflyway is an end-to-end encrypted HTTP/SOCKS5 proxy client/server written in golang, featuring:

1. TCP tunneling
2. TCP tunneling over WebSocket
3. Multiplex connections
4. Man-in-the-middle
5. UDP over TCP (SOCKS5)



## Notice

Default port 8100,compatible with Synology NAS.

## Supported Architectures

Our images only architectures `x86-64` now.

## Usage

Here are some example snippets to help you get started creating a container.

### docker

Please relpace `<key>` with you custom password and replace `8100` with port you want to use.

```shell
docker create \
  --name=goflyway \
  -p 8100:8100 \
  --restart unless-stopped \
  benzbrake/goflyway
  -k="<key>" -l=":8100" -proxy-pass="https://bing.com"
```

### docker-compose

```yaml
version "3"
services:
  goflyway:
    image: benzbrake/goflyway
    container_name: goflyway
    restart: always
    command: -k="<key>" -l=":8100" -proxy-pass="https://bing.com"
    ports:
      - 8080:8100

```

## Support Info

- Shell access whilst the container is running: `docker exec -it goflyway /bin/sh`
- To monitor the logs of the container in realtime: `docker logs -f goflyway`

# License

If you feel this image is useful, you can buy me a coffee
[![Buy Ryan A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Ryan A Coffee")](https://www.buymeacoffee.com/buyryanacoffie "Buy Ryan A Coffee")
Ant then, copy as you want.