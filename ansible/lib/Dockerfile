FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["yarn", "start"]
