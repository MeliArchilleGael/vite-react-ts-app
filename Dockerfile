

FROM node:21.7.1


WORKDIR /var/www

RUN git clone https://github.com/MeliArchilleGael/vite-react-ts-app.git

WORKDIR /var/www/vite-react-ts-app

RUN npm install

RUN chmod -R 777 ./public

RUN npm run build

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /var/www/vite-react-ts-app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "deamon off;"]







