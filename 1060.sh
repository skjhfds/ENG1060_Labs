#!/bin/sh
git pull
git add .
echo "commit message:"
read msg
git commit -m "$msg"
git push
