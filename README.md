# newGryfiPage
Project to integrate concrete5 with owncloud. Now you have a CMS for your Homepage with owncloud as File Storage integrated. test


#docker
you can run newgryfipage with docker
if you haven't build the image yet

```bash
docker build . -t bacluc/newgryfipage
```

to start docker container (your previous data will be lost)

```bash
docker run -d -p 8080:80 \
 -e LOG_STDOUT=true \
 -e LOG_STDERR=true \
 -e LOG_LEVEL=debug \
 -v $(pwd):/var/www/html \
 --name bacgr \
 bacluc/newgryfipage 
```

if you want  to use xdebug on linux:

```bash
docker run -d -p 8080:80 \
 -e XDEBUG_CONFIG="remote_host=$(hostname -I | awk '{print $1}')" 
 -e LOG_STDOUT=true \
 -e LOG_STDERR=true \
 -e LOG_LEVEL=debug \
 -v $(pwd):/var/www/html \
 --name bacgr \
 bacluc/newgryfipage 
```

if you want to use xdebug on windows:
```bash
YOUR_IP=your current ip
docker run -d -p 8080:80 \
 -e XDEBUG_CONFIG="remote_host=$YOUR_IP" 
 -e LOG_STDOUT=true \
 -e LOG_STDERR=true \
 -e LOG_LEVEL=debug \
 -v $(pwd):/var/www/html \
 --name bacgr \
 bacluc/newgryfipage 
```

stop container

```bash
docker stop bacgr

```

restart container with previous data:
```bash
docker start bacgr
```

##Attention: 
backups your database config in database.backup.php the first time
second time again, then your database config will be overwritten