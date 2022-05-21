# portable-arch-linux-workstation

portable workstation, everywhere, every system.

# how to run

```bash
docker-compose up
```

then open shell and set vnc password

```
docker exec -it arch-linux-vnc zsh

# set vnc password
vncpasswd
```

then 

**RESTART** via `docker-compose up -d`

# how to connect xfce4 desktop via vnc

open `realvnc-viewer` , and type

```bash
localhost:1
```

enter.

That's all.

Enjory!