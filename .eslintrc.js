module.exports = {
  // ... other ESLint configurations

  plugins: [
    // ... other plugins
    'react-hooks',
  ],

  rules: {
    // ... other rules
    'react-hooks/exhaustive-deps': 'warn', // or 'error' for a more strict enforcement
  },
};

