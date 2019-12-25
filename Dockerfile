# as is tagging the image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# for Run phase
FROM nginx
EXPOSE 80
# Copy from a different stage
COPY --from=builder /app/build /usr/share/nginx/html
