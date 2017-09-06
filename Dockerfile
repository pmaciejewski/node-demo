FROM node:6-alpine


WORKDIR /app

ENV NODE_ENV development

EXPOSE 8080

ADD . .

RUN npm install

CMD ["npm", "start"]