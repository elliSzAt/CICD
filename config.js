// // Application Configuration
// // ⚠️ This file contains secrets that will be BLOCKED by GitHub Push Protection

// const config = {
//   environment: 'production',
  
//   // Database Configuration
//   database: {
//     host: 'prod-db.company.com',
//     port: 5432,
//     username: 'admin',
//     password: 'Super$ecretP@ssw0rd2024',  // ← Generic password (may bypass)
//     database: 'production_app'
//   },

//   // API Keys - These WILL be caught by GitHub Push Protection  
//   services: {
//     stripe: {
//       publishableKey: 'pk_live_1234567890abcdefghijklmnopqrstuvwxyz',
//       secretKey: 'sk_live_1234567890abcdefghijklmnopqrstuvwxyz123456'  // ← STRIPE LIVE KEY (BLOCKED!)
//     },
    
//     aws: {
//       accessKeyId: 'AKIAIOSFODNN7EXAMPLE',           // ← AWS ACCESS KEY (BLOCKED!)
//       secretAccessKey: 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'  // ← AWS SECRET (BLOCKED!)
//     },
    
//     openai: {
//       apiKey: 'sk-1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdef'  // ← OpenAI format (may be blocked)
//     },
    
//     github: {
//       personalAccessToken: 'ghp_1234567890abcdefghijklmnopqrstuvwxyz12345'  // ← GitHub PAT (BLOCKED!)
//     }
//   },

//   // JWT Configuration
//   jwt: {
//     secret: 'my-super-secret-jwt-signing-key-2024',  // ← Generic secret (may bypass)
//     expiresIn: '24h',
//     issuer: 'myapp'
//   },

//   // Session Configuration  
//   session: {
//     secret: 'session-secret-key-for-production-2024',  // ← Generic secret (may bypass)
//     name: 'sessionId',
//     secure: true
//   },

//   // Email Configuration
//   email: {
//     smtp: {
//       host: 'smtp.gmail.com',
//       port: 587,
//       secure: false,
//       auth: {
//         user: 'noreply@company.com',
//         pass: 'EmailP@ssw0rd2024!'  // ← Email password (may bypass)
//       }
//     }
//   }
// };

// module.exports = config;
