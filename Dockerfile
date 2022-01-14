FROM python:3.8.12-alpine3.14
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apk update && apk add --no-cache \
    gcc \
    make \
    build-base \
    py3-virtualenv \
    && rm -rf /var/cache/apk/*
WORKDIR /code
COPY . .
RUN virtualenv --python python3 ./venv
RUN source /code/venv/bin/activate
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install Django pytest-django
RUN addgroup -S appgroup
RUN adduser -S -D -h /usr/app/src appuser appgroup
RUN chown -R appuser:appgroup /code
USER appuser