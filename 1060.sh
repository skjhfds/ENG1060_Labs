#!/bin/sh
git pull
git add .
read -p "commit message:" msg
git commit -m "$msg"
git push
