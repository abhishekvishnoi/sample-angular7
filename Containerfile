# Runtime image — expects dist/sample-angular7 to already exist (built by Tekton ng-build task or local npm run build)
FROM nginx:1.25-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist/sample-angular7 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
