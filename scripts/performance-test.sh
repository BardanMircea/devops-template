#!/bin/bash
# filepath: c:\Users\Wheremywagonat\Desktop\ISI\GenAI\devops-template\scripts\performance-test.sh

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting performance tests..."

# Test Node.js app
echo "Testing Node.js app..."
ab -n 1000 -c 50 http://localhost:3000/

# Test Python app
echo "Testing Python app..."
ab -n 1000 -c 50 http://localhost:5000/

echo "Performance testing complete!"