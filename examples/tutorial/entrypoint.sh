#!/usr/bin/env bash
export FLASK_APP=flaskr
export FLASK_ENV=development

flask init-db
gunicorn -w 4 -b 0.0.0.0:5000 "flaskr:create_app()"
