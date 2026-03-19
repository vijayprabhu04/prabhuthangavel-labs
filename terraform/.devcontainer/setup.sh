#!/bin/bash
# Configure the lab environment — runs automatically when Codespace starts.

echo "⏳ Waiting for LocalStack..."
for i in $(seq 1 30); do
  if curl -s http://localstack:4566/_localstack/health | grep -q '"s3"'; then
    echo "✅ LocalStack is ready!"
    break
  fi
  sleep 2
done

# Configure AWS CLI to use LocalStack (dummy credentials)
aws configure set aws_access_key_id test
aws configure set aws_secret_access_key test
aws configure set region us-east-1

# Add alias so 'aws' commands route to LocalStack automatically
cat >> ~/.bashrc << 'EOF'
alias aws='aws --endpoint-url=http://localstack:4566'
alias lab-status='echo "🔍 Checking LocalStack..." && curl -s http://localstack:4566/_localstack/health | python3 -m json.tool'
EOF

source ~/.bashrc

echo ""
echo "🚀 Lab environment ready!"
echo "   Terraform + AWS CLI + LocalStack — all configured."
echo "   Run 'lab-status' to check LocalStack health."
echo ""
