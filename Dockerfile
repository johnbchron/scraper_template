
FROM lwthiker/curl-impersonate:0.5.4-chrome-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN apt-get install git libcurl4-openssl-dev libssl-dev -y

WORKDIR /
RUN git clone https://github.com/ycq0125/pycurl
WORKDIR /pycurl
RUN python3 setup.py install --curl-config=/usr/local/bin/curl-impersonate-chrome-config

RUN pip3 install git+https://github.com/johnbchron/requests-curl

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 install -r requirements.txt

RUN mkdir data
COPY *.py /app/

ENV CURL_IMPERSONATE=chrome110
ENV TZ=America/Chicago

CMD ["python3", "main.py"]