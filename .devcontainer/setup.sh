#!/bin/bash
# Start LocalStack and configure AWS CLI.

echo "⏳ Starting LocalStack..."
docker run -d --name localstack \
  -p 4566:4566 \
  -e SERVICES=s3,iam,sts,sqs,dynamodb \
  -e DEFAULT_REGION=us-east-1 \
  localstack/localstack:latest

# Wait for it to be ready
for i in $(seq 1 30); do
  if curl -s http://localhost:4566/_localstack/health | grep -q '"s3"'; then
    echo "✅ LocalStack is ready!"
    break
  fi
  sleep 2
done

# Configure AWS CLI for LocalStack
aws configure set aws_access_key_id test
aws configure set aws_secret_access_key test
aws configure set region us-east-1

# Add alias so 'aws' routes to LocalStack
echo 'alias aws="aws --endpoint-url=http://localhost:4566"' >> ~/.bashrc
echo 'alias lab-status="curl -s http://localhost:4566/_localstack/health | python3 -m json.tool"' >> ~/.bashrc

echo ""
echo "🚀 Lab environment ready!"
echo "   terraform, aws cli, localstack — all configured."
echo "   cd terraform/lab-01-getting-started/02-your-first-s3-bucket to start."
echo ""
