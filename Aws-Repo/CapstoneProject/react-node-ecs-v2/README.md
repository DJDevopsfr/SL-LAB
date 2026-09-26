# Minimal React + Node ECS application

This version is designed so the **browser never needs the private ECS backend address**.

```text
Browser -> ALB -> frontend ECS/nginx :80 -> backend ECS :3001
```

React always calls `/api/time`. nginx forwards `/api/*` to the value of `BACKEND_URL`.
This keeps the backend private and avoids CORS.

## Local Docker test

```bash
docker compose up --build
```

Open `http://localhost:3000`. Compose uses `BACKEND_URL=http://backend:3001`.

## Local development

Backend:
```bash
cd backend
npm install
npm start
```

Frontend (another terminal):
```bash
cd frontend
npm install
npm run dev
```

Open `http://localhost:5173`. Vite proxies `/api` to `localhost:3001`.

## ECS

Create two ECS services. Put only the frontend behind the public ALB. Use ECS Service Connect (or Cloud Map) to give the backend a stable private DNS name.

Frontend service:
- container port `80`
- ALB target group -> port `80`
- ALB health check `/health`
- environment variable `BACKEND_URL=http://backend:3001`

Backend service:
- container port `3001`
- health endpoint `/health`
- Service Connect client alias such as `backend`, port `3001`
- no public ALB required

Security groups should permit ALB -> frontend:80 and the required frontend/task networking -> backend:3001 only.

The official nginx image automatically substitutes environment variables in `/etc/nginx/templates/*.template` when the container starts, so **the same frontend image can be deployed to dev/test/prod without rebuilding it**.
