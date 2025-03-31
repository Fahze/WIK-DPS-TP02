# Base 

FROM node:20-alpine AS base

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

# Build 
FROM base AS build

WORKDIR /app

RUN npm run build

# Run

FROM base AS production

WORKDIR /app

ENV NODE_ENV=production

USER node

COPY --from=build /app/dist ./dist

CMD ["node", "dist/index.cjs"]