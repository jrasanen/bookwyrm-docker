FROM python:3.9

ENV PYTHONUNBUFFERED 1

RUN mkdir /app /app/static /app/images

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt --no-cache-dir

COPY . /app

CMD ["gunicorn", "bookwyrm.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
