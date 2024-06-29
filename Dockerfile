FROM python:3.8-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y --purge \
        build-essential \
        python3-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
CMD python3 main.py