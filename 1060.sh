#!/bin/sh
cd /home/hcho/Documents/ENG1060/repo/ENG1060_Labs
git pull
git add .
read -p "commit message:" msg
git commit -m "$msg"
git push https://skjhfds:sZfjVYp978FR5pS@github.com/skjhfds/ENG1060_Labs.git
