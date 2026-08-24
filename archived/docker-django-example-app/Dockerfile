# syntax=docker/dockerfile:1

FROM python:3.12-alpine

ARG APP_VERSION="1.0"
ARG APP_NAME="my-application-1"

# Install python and its virtualenv
RUN apk add --update --no-cache \
    #python3 \
    #py3-pip \
    python3-dev \
    py3-virtualenv

WORKDIR /app

# Copy requirements.txt
COPY src/requirements.txt requirements.txt

# Create virtualenv
RUN python3 -m venv venv && \
    venv/bin/pip install --upgrade pip && \
    venv/bin/pip install -r requirements.txt

# Copy everything else
COPY src/my-application-1.py ./

RUN mkdir -p /app/out /app/logs

# Redirect output to log file
ENTRYPOINT ["sh", "-c", "venv/bin/python my-application-1.py > /app/logs/logfile.trc 2>&1"]



# OSEF

# CMD ["node", "src/index.js"]

# open port 3000 to the outside
# EXPOSE 3000
