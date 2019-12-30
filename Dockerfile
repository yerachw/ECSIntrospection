# this Dockerfile needs to be run from the parent context
# its name has been modified so as not to cause a problem when deployong to beanstalk
FROM python:3.6-stretch
LABEL maintainer="Hyperlync Technologies <roni@hyperlync.com>" version="1.0"

RUN pip install requests
RUN mkdir /app
WORKDIR /app

COPY ./intro.py /app

CMD ["python3", "intro.py"]

