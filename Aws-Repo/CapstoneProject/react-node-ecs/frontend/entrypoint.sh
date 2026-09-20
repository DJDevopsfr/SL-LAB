#!/bin/sh
cat > /app/public/env.js <<EOF2
window.ENV={BACKEND_URL:"${BACKEND_URL:-http://localhost:3001}"};
EOF2
exec npm start
