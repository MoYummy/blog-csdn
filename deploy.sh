#!/bin/bash

deploy_dir=$1
set -o errexit -o nounset
if [ "$TRAVIS_BRANCH" != "deploy" ]
then
  echo "No deploy on $TRAVIS_BRANCH"
  exit 0
fi

echo "Deploying"
git add -f ${deploy_dir} && \
git commit -am "Deploy on gh-pages" && \
git subtree split --prefix ${deploy_dir} -b gh-pages && \
git push --force "https://$GH_TOKEN@github.com/MoYummy/blog-csdn.git" gh-pages:gh-pages