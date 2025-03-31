# Base 
FROM node:23.9-alpine3.21 AS base

# Build 
FROM base AS build

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

# Run

FROM base AS run

WORKDIR /app

ENV NODE_ENV=production

COPY --from=build /app/node_modules ./node_modules

COPY --from=build /app/dist ./dist

USER node

CMD ["node", "dist/index.cjs"]