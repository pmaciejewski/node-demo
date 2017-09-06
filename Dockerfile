FROM node:6-alpine

WORKDIR /app
EXPOSE 8080
ADD . .
RUN npm install

CMD ["npm", "start"]