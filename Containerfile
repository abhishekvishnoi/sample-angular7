# Build stage — Node 12 is compatible with Angular 7 tooling
FROM node:12.22.12-alpine AS build

WORKDIR /app

COPY package.json package-lock.json .npmrc ./
RUN npm ci

COPY angular.json tsconfig.json .browserslistrc ./
COPY scripts ./scripts
COPY src ./src

RUN ./node_modules/.bin/ng build --prod

# Runtime stage — serve static assets with nginx
FROM nginx:1.25-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/sample-angular7 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
