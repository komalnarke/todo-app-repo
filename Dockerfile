FROM python:3.12-alpine

RUN apk add --no-cache build-base \
    && apk add --no-cache python3-dev \
    && apk add --no-cache py3-pip \
    && apk add --no-cache python3-distutils


WORKDIR /data

COPY . .


RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py migrate

EXPOSE 8000


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
