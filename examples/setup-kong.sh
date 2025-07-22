#!/bin/bash
echo "🔧 Configuring Kong APIs..."

BASE_URL="http://localhost:7001"

# Wait for Kong to be ready
echo "Waiting for Kong to be ready..."
until curl -s $BASE_URL > /dev/null; do
  sleep 2
done

# IND Service
curl -X POST $BASE_URL/services \
  --data name=ind-service \
  --data url=http://mock-ind-service:1080

curl -X POST $BASE_URL/services/ind-service/routes \
  --data paths[]=/api/ind \
  --data strip_path=true

# Gemeente Service  
curl -X POST $BASE_URL/services \
  --data name=gemeente-service \
  --data url=http://mock-gemeente-service:1080

curl -X POST $BASE_URL/services/gemeente-service/routes \
  --data paths[]=/api/gemeente \
  --data strip_path=true

# Rate limiting
curl -X POST $BASE_URL/services/ind-service/plugins \
  --data name=rate-limiting \
  --data config.minute=100

echo "✅ Kong APIs configured!"
