# Minimal React + Node ECS example

## Local Docker test
```sh
docker compose up --build
```
Open http://localhost:3000.

## Local without Docker
Backend:
```sh
cd backend && npm install && npm start
```
Frontend:
```sh
cd frontend && npm install
BACKEND_URL=http://localhost:3001 npm start
```
Note: `BACKEND_URL` is injected by the frontend container entrypoint. When running Vite directly, the fallback is `http://localhost:3001`.

## ECS
Build/push `frontend/Dockerfile` and `backend/Dockerfile` separately. Set the frontend ECS task environment variable `BACKEND_URL` to a URL reachable by the user's browser, such as the backend service's public/internal-load-balancer URL as appropriate.

Important: a browser cannot resolve an ECS/Cloud Map private service name unless that name is reachable/resolvable from the browser's network. For a public frontend, normally expose the backend through an ALB/API endpoint and set `BACKEND_URL` to that URL.
