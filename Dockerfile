FROM node:18.15.0 AS build

WORKDIR /usr/src/app

COPY . .

RUN yarn install

RUN yarn run build

FROM busybox:1.35 as deploy

RUN adduser -D static
USER static
WORKDIR /home/static

COPY --from=build /usr/src/app/build/ ./

EXPOSE 3000

CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]