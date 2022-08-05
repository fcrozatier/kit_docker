FROM node:18-alpine

WORKDIR /test-app

COPY package.json package-lock.json ./

RUN npm ci
COPY . .
RUN npm run build

CMD npm rebuild esbuild && npm run dev -- --host
