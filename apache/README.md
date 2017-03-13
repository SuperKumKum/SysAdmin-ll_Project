## Add the docker image from eboraas/apache-php 
`docker pull eboraas/apache-php` 

## Run the docker image 

`docker run -d --publish 80:80 --publish 443:443 --name=apache --dns=151.80.119.151 \
--volume /srv/docker/apache/etc/:/etc/apache2/ \
--volume /srv/docker/apache/log/:/var/log/apache2 \
--volume /srv/docker/apache/www:/var/www/ \
eboraas/apache-php`

# Files edited
To Be Continued ... 
