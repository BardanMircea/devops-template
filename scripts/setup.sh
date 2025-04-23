#!/bin/bash
# filepath: c:\Users\Wheremywagonat\Desktop\ISI\GenAI\devops-template\scripts\setup.sh

# Exit immediately if a command exits with a non-zero status
set -e

echo "Initializing the project..."

# Install dependencies
echo "Installing dependencies..."
npm install
pip install -r requirements.txt

# Initialize Terraform
echo "Initializing Terraform..."
cd terraform/environments/dev
terraform init

echo "Setup complete!"