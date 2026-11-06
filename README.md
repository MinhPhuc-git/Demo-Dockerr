# Node 18 / Node 20 Docker demo

This project deliberately requires Node 18.x. The Express example itself is not inherently incompatible with Node 20.

- package.json engines.node: 18.x
- .npmrc engine-strict=true: npm ci/install fails with EBADENGINE on Node 20.
- check-node.js: npm start also rejects versions other than 18.
- Dockerfile defaults to Node 18.0.0, independent of the host Node version.

## Run with Docker (Node 18)

```powershell
docker compose up -d --build
curl.exe http://localhost:3000
docker compose logs web
```

The response includes node_version: v18.0.0.

## Reproduce the Node 20 failure

```powershell
docker build --build-arg NODE_VERSION=20.0.0 -t demo-dockerr:node20 .
```

Expected: npm ci fails with EBADENGINE (required Node 18.x, actual Node 20.0.0).

## Run locally

With Node 18 active:

```powershell
node -v
npm.cmd ci
npm.cmd start
```

.nvmrc documents the version; it does not automatically change an installed Node version.
Docker uses its own Node runtime; Node 20 on the host does not conflict with Node 18 inside the container.

## Current intentional failure configuration

Compose now passes NODE_VERSION=16.20.2 while the project requires 18.x.
Running docker compose up -d --build is expected to fail with EBADENGINE.
A previously running Node 18 container can continue serving during this failed build.
To fix: change NODE_VERSION in compose.yaml back to "18.0.0", then run docker compose up -d --build.

