FROM node:18.15.0

# Reduce npm log spam and colour during install within Docker
ENV NPM_CONFIG_LOGLEVEL=warn
ENV NPM_CONFIG_COLOR=false

RUN apt-get update

RUN apt-get install curl -y

RUN apt-get install git -y

WORKDIR /usr/src/app

RUN node -v

RUN yarn install

COPY . .

EXPOSE 3000

RUN chmod +x /usr/src/app/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/usr/src/app/entrypoint.sh"]