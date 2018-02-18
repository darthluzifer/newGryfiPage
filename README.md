# newGryfiPage
Project to integrate concrete5 with owncloud. Now you have a CMS for your Homepage with owncloud as File Storage integrated. test


#docker
you can run newgryfipage now with docker
if you haven't build the image yet

docker build . -t bacluc/newgryfipage

to start docker container (your previous data will be lost)

docker run -d -p 8080:80 -e LOG_STDOUT=true -e LOG_STDERR=true -e LOG_LEVEL=debug -v $(pwd):/var/www/html --name bacgr bacluc/newgryfipage

stop container

docker stop bacgr

docker start bacgr

attention: backups your database config in database.backup.php the first time
second time again, then your database config will be overwritten