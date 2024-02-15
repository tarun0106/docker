# Use node:14-alpine as base image
FROM node:14-alpine
# Set /app as working directory
WORKDIR /app
# Copy package.json and package-lock.json files to /app
COPY package*.json /app/
# Install dependencies
RUN npm install
# Copy app source code to /app
COPY . /app/
# Expose port 8000
EXPOSE 8000
# Run app.js as entrypoint
CMD ["node", "app.js"]
