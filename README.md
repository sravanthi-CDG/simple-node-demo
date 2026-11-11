# Simple Node.js Demo

A tiny Express app (static homepage + `/api/info` + `/health`) built to demo
deploying the *same* codebase to:

1. **AWS EC2** (manual server setup)
2. **AWS Elastic Beanstalk** (managed PaaS)
3. **AWS Amplify Hosting** (static hosting of the `public/` folder)
4. **Docker** (containerized deployment)

## Run locally
```bash
npm install
npm start
# open http://localhost:3000
```

## Run with Docker
```bash
# Build and run directly
docker build -t simple-node-demo .
docker run -d -p 3000:3000 --name simple-node-demo simple-node-demo

# Or run with Docker Compose
docker compose up -d
```

See the accompanying deployment guide for step-by-step console instructions.
