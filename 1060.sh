#!/bin/sh
git pull
git add .
read -p "commit message:" msg
git commit -m "$msg"
git push https://skjhfds:sZfjVYp978FR5pS@github.com/ENG1060_Labs.git
