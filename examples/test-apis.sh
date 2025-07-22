#!/bin/bash
echo "🧪 Testing MIRA APIs..."

# Setup Kong first
./examples/setup-kong.sh
sleep 2

# Test Kong health
echo "Kong Gateway Status:"
curl -s http://localhost:7001 | jq '.version // "Kong is running"' || echo "Kong not ready"

echo -e "\nTesting API routes through Kong:"

# Test routes
echo "IND API route test:"
curl -s -w "\nHTTP Status: %{http_code}\n" \
  http://localhost:7000/api/ind/health || echo "IND route not ready"

echo -e "\nGemeente API route test:"  
curl -s -w "\nHTTP Status: %{http_code}\n" \
  http://localhost:7000/api/gemeente/health || echo "Gemeente route not ready"

echo -e "\n✅ Basic API tests completed"
echo "📖 Check Swagger UI at http://localhost:8090 for more API details"
