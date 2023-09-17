#!/usr/bin/bash

# Delete docker container by name "portfolio-2023"
docker rm -f portfolio-2023 || true

#  Search for any docker images that use the "portfolio-2023" repository name and attempt to remove them
docker rmi -f $(docker images portfolio-2023)

# Remove any dangling images - be careful this caused problems with nginx
# docker system prune

#  Navigate to the debian folder, delete current "portfolio-2023" directory
cd /

cd home

cd debian

rm -r portfolio-2023

#  Clone latest version from github
git clone https://github.com/joshl26/portfolio-2023.git

cd portfolio-2023

#  Build new docker image
docker build -t portfolio-2023 .

#  Start new docker container from updated portfolio-2023 image, replace XX with your port # below example 3001
docker run --restart always -p XXXX:XXXX -e VIRTUAL_HOST=joshlehman.ca,www.joshlehman.ca -e VIRTUAL_PATH=/ --name=portfolio-2023 portfolio-2023
