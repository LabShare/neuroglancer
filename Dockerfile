FROM node:12

COPY . .
RUN npm install
RUN npm run build-min


FROM nginx:stable

COPY --from=0 dist/min/ /neuroglancer
COPY nginx.conf /etc/nginx/nginx.conf
