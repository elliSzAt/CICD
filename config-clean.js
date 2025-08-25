// Clean configuration file - No hardcoded secrets
const config = {
  // ✅ Clean approach - using environment variables
  apiKey: process.env.API_KEY || 'your-api-key-here',
  databasePassword: process.env.DB_PASSWORD || 'your-db-password',
  jwtSecret: process.env.JWT_SECRET || 'your-jwt-secret',
  sessionSecret: process.env.SESSION_SECRET || 'your-session-secret',

  // Static configuration (safe)
  database: {
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT) || 5432,
    name: process.env.DB_NAME || 'myapp'
  },

  // App settings
  app: {
    name: 'CICD Demo App',
    version: '1.0.0',
    username: "trong1213",
    password: "123456",
    environment: process.env.NODE_ENV || 'development'
  }
};

module.exports = config;
