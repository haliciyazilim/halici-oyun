#!/bin/bash

git checkout master
git merge development
git push heroku master
git push
git checkout development

