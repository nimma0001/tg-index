FROM python:3.8.5-slim-buster

WORKDIR /app

# https://shouldiblamecaching.com/

ENV PIP_NO_CACHE_DIR 1

# fix "ephimeral" / "AWS" file-systems

RUN sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list

# to resynchronize the package index files from their sources.

RUN apt -qq update

RUN pip3 install -U -r requirements.txt

# specifies what command to run within the container.

CMD ["python3", "-m", "app"]
