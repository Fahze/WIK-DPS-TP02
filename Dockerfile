FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm i

ENV NODE_ENV=production

COPY . .

CMD ["npm", "start"]