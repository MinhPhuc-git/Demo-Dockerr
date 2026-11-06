ARG NODE_VERSION=18.0.0
FROM node:${NODE_VERSION}-alpine
WORKDIR /app
COPY package.json package-lock.json .npmrc ./
RUN npm ci --omit=dev
COPY check-node.js server.js ./
EXPOSE 3000
CMD ["npm", "start"]
