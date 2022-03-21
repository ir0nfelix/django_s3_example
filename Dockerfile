FROM python:3.10.2

COPY ./config-django-user.sh /config-django-user.sh
RUN chmod +x ./config-django-user.sh
RUN ./config-django-user.sh

RUN mkdir -p /django_application && mkdir -p /django_application/upload && chown -R django /django_application
WORKDIR /django_application


RUN pip install --upgrade pip
ADD ./requirements.txt /django_application
RUN pip install -r requirements.txt
RUN pip install psycopg2-binary --no-binary psycopg2-binary


COPY ./start.sh /start.sh
RUN chown django /start.sh && chmod +x /start.sh

ADD . /django_application/

CMD ["/start.sh"]
