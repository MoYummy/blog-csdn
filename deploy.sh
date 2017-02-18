#!/bin/bash

deploy_dir=$1
set -o errexit -o nounset
if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "No deploy on $TRAVIS_BRANCH"
  exit 0
fi
echo "Deploying"

cd ${deploy_dir}
git init
git config user.email "mo_yummy@sina.cn"
git remote add upstream "https://$GH_TOKEN@github.com/MoYummy/blog-csdn.git"
git fetch upstream
git reset upstream/gh-pages
touch .
git add -A .
git commit -m "deploy"
git push -q upstream HEAD:gh-pages