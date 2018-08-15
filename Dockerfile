FROM node:9 as builder
RUN mkdir -p ./visa-frontend
WORKDIR ./visa-frontend
COPY ./ ./
RUN yarn && yarn build --prod --build-optimizer
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /visa-frontend/dist /usr/share/nginx/html
EXPOSE 80
