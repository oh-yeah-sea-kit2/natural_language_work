FROM python:3.6.5
# FROM python:3
USER root

# FROM python:3.6.5-jessie

RUN apt-get update
RUN apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less

RUN apt-get update && apt-get install -y \
  mecab \
  libmecab-dev \
  mecab-ipadic \
  mecab-ipadic-utf8 \
  nkf \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
RUN pip install --upgrade setuptools


WORKDIR /usr/src/app
COPY opt/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
