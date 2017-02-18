#!/bin/bash

config_yml=$1
sed -i 's/jekyll-theme-csdn/blog-csdn/' ${config_yml}
sed -i 's/moyummy/moyummy/' ${config_yml}
sed -i 's/destination: .\/docs/destination: ..\/docs/' ${config_yml}
cat ${config_yml}