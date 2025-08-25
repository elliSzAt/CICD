// Test file để demo security failure
const config = {
  // Generic secrets - should trigger Gitleaks (not GitHub Push Protection)
  apiKey: 'sk-test123456789012345678901234567890',
  databasePassword: 'production-db-secret-password-2024',
  jwtSecret: 'my-super-secret-jwt-signing-key-production',
  sessionSecret: 'session-secret-key-for-authentication'
};

module.exports = config;
