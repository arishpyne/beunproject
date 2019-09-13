FROM python:3.7

WORKDIR /proj

COPY requirements.txt .

RUN ["pip", "install", "-r", "requirements.txt"]

COPY . .
