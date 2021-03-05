FROM node:lts-alpine as build-stage
WORKDIR /app

COPY school-fe/package*.json ./
COPY school-fe/. .

RUN npm install
RUN npm install -g @quasar/cli
RUN npx quasar build

# production stage
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]