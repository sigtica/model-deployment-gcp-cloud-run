FROM python:3.8
ENV PYTHONUNBUFFERED True
ENV APP_HOME /content
RUN apt-get update && apt-get install zip unzip nano wget -y
WORKDIR $APP_HOME
COPY . ./
RUN pip install --upgrade pip
RUN pip install Flask==2.2.2 werkzeug==2.2.2 gunicorn==20.1.0 
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 server:app