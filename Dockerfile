# Use can existing image as base
FROM node:14-alpine as builder
WORKDIR /app

# Download and install a dependency
copy package.json .
RUN npm install
copy . .

# Tell the image what to do when it starts
# as a container
CMD ["npm","run","build"]

from nginx
copy --from=builder /app/build /usr/share/nginx/html
