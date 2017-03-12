## Installation
`docker pull superkumkum/docker-bind` 


## start bind 
`docker run --name bind --publish 53:53/udp --publish 53:53/tcp --volume /srv/docker/bind:/data superkumkum/docker-bind`

## Persistence 
We need to mount the volume for the access of the configuration files, for that we nned to create the folder `/data`.
By using those commands : 
`mkdir -p /srv/docker/bind`
`chcon -Rt svirt_sandbox_file_t /srv/docker/bind`

## Shell Access aka "Comment on fait pour modifier les conf.file?" : 
`docker exec -it <namedOfImage> bash`
