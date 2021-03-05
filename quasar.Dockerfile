FROM node:lts-alpine as build-stage
WORKDIR /app
COPY school-fe/package*.json ./
RUN npm install
RUN npm install -g @quasar/cli
COPY school-fe/. .
RUN npx quasar build

# production stage
FROM nginx:stable-alpine as production-stage

RUN rm /usr/share/nginx/html/50x.html
RUN rm /usr/share/nginx/html/index.html

COPY --from=build-stage /app/dist/ /usr/share/nginx/html

# RUN mv /usr/share/nginx/html/spa/* /usr/share/nginx/html/
# RUN rm /usr/share/nginx/html/spa

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]