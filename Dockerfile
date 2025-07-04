FROM python:3.11-slim

RUN mkdir /webapp
WORKDIR /webapp

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY flask_app/ .
CMD ["python", "-u", "run.py"]