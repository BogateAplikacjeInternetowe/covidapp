#!/usr/bin/env sh
# abort on errors
set -e
# build
npm run build
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git init
git add -A
# Change description of commit:
git commit -m 'deploy'
# If you want to deploy from your account change my: 'KSlosarczyk'
git push -f git@github.com:KSlosarczyk/poland2021statistics.git master
# change back to previous directory
cd -