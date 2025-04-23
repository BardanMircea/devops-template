#!/bin/bash
# filepath: c:\Users\Wheremywagonat\Desktop\ISI\GenAI\devops-template\scripts\deployment-verify.sh

# Exit immediately if a command exits with a non-zero status
set -e

echo "Verifying deployment..."

# Check Node.js app
NODE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)
if [ "$NODE_STATUS" -eq 200 ]; then
  echo "Node.js app is running successfully!"
else
  echo "Node.js app verification failed!"
  exit 1
fi

# Check Python app
PYTHON_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000)
if [ "$PYTHON_STATUS" -eq 200 ]; then
  echo "Python app is running successfully!"
else
  echo "Python app verification failed!"
  exit 1
fi

echo "Deployment verification complete!"