import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    host: '0.0.0.0',
    port: 5173,
    allowedHosts: [
      'devbank-alb-530304309.us-east-1.elb.amazonaws.com'
    ]
  }
})
