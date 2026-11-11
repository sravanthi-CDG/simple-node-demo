# Use the official Node.js LTS image based on Alpine Linux for a small footprint
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Set production environment variables
ENV NODE_ENV=production \
    PORT=3000 \
    DEPLOY_TARGET=docker

# Copy dependency manifests first to leverage Docker layer caching
COPY package*.json ./

# Install production dependencies
RUN npm ci --omit=dev && npm cache clean --force

# Copy the rest of the application files
COPY . .

# Use non-root node user provided by the official image
USER node

# Expose the application port
EXPOSE 3000

# Health check using the existing /health route
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Start the server
CMD ["node", "server.js"]

