#!/usr/bin/bash

# Delete docker container by name "pomodoro-app"
docker rm -f pomodoro-app || true

#  Search for any docker images that use the "pomodoro-app" repository name and attempt to remove them
docker rmi -f $(docker images pomodoro-app)

# Remove any dangling images - be careful this caused problems with nginx
# docker system prune

#  Navigate to the debian folder, delete current "pomodoro-app" directory
cd /

cd home

cd debian

rm -r pomodoro-app

#  Clone latest version from github
git clone https://github.com/joshl26/pomodoro-app.git

cd pomodoro-app

#  Build new docker image
docker build -t pomodoro-app .

#  Start new docker container from updated pomodoro-app image
docker run --restart always -p 3051:3051 -e VIRTUAL_HOST=joshlehman.ca,www.joshlehman.ca -e VIRTUAL_PATH=/pomodor/ --name=pomodoro-app pomodoro-app
