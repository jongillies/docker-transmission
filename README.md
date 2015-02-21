# docker transmission

This is a Dockerfile to set up "Transmission" - (https://www.transmissionbt.com/)

Build from docker file

```
git clone git@github.com:jongillies/docker-transmission.git
cd docker-transmission
docker build -t transmission .
```


docker run -d \
    -v $TRANSMISSION_MOVIES_WATCH:/watch \
    -v $TRANSMISSION_MOVIES_COMPLETE:/downloads \
    -v $TRANSMISSION_MOVIES_INCOMPLETE:/incomplete \
    -v $TRANSMISSION_MOVIES_CONFIG:/config  \
    -p your_external_port:45555 -p 9091:9091 \
    -e "USERNAME=username" -e "PASSWORD=password" --name transmission transmission

