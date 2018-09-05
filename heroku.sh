#!/bin/bash

heroku create ebatech-putsreq
heroku addons:create mongolab:sandbox --as MONGOLAB
heroku addons:create heroku-redis:hobby-dev --as REDIS
git push heroku master
