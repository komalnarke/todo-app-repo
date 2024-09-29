

FROM python:3.12-alpine

RUN apk add --no-cache py3-pip python3-dev libffi-dev gcc musl-dev linux-headers


RUN apk add --no-cache python3-distutils


WORKDIR /data


RUN pip install django==3.2


COPY . .


RUN python manage.py migrate


EXPOSE 8000


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
