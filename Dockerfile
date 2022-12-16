FROM node:latest

RUN mkdir -p /var/www
WORKDIR /var/www

RUN npm i npm@latest -g

WORKDIR /var
COPY frontend/app/package.json frontend/app/package-lock.json* ./
RUN npm install  && npm cache clean --force
ENV PATH /var/node_modules/.bin:$PATH

WORKDIR /var/www
COPY frontend/app /var/www

CMD ["npm", "run", "dev"]

EXPOSE 3000
