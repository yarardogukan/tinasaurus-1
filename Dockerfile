FROM node:18.15.0

RUN apt-get update

RUN apt-get install curl -y

RUN apt-get install git -y

WORKDIR /usr/src/app

RUN node -v

COPY . .

RUN yarn install

RUN yarn run build

EXPOSE 3000

RUN chmod +x /usr/src/app/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/usr/src/app/entrypoint.sh"]