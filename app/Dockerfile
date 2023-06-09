FROM python:3.8
ENV PYTHONUNBUFFERED True
ENV APP_HOME /content
RUN apt-get update && apt-get install zip unzip nano wget -y
WORKDIR $APP_HOME
COPY . ./
RUN pip install --upgrade pip
RUN pip install Flask==2.0.1
RUN pip install gunicorn==20.1.0 
RUN pip install eventlet==0.30.2
EXPOSE 8080
CMD flask --app server run --host 0.0.0.0 --port 8080 --debug