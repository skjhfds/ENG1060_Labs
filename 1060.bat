@echo off
cd "C:\Users\HC\Documents\Uni Stuff\ENG1060\repo\ENG1060_Labs"
git pull
git add --all
set /p msg=Enter commit message:
git commit -m "%msg%"
git push