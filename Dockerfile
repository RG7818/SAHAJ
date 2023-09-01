FROM gcc:12.2.0@sha256:8e3440ab6d1417a55c5c1bf91a244a566ddc178024fd8e1b26066cd68ac67130 as cache

RUN  apt update -y && apt install --no-install-recommends libasio-dev -y

FROM cache
WORKDIR /home/app
COPY . .
RUN  g++ main.cpp -lpthread -o program.out

ENTRYPOINT ./program.out