#!/bin/sh

python /django_application/manage.py migrate
python /django_application/manage.py collectstatic --noinput

exec gunicorn -c /django_application/gunicorn.py django_s3_example.wsgi
