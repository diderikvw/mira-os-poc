#!/bin/bash
echo "📊 MIRA Services Status:"
echo "========================"
docker-compose ps

echo -e "\n🌐 Service Health:"
services=(
  "localhost:8222,NATS"
  "localhost:7001,Kong" 
  "localhost:8080,Keycloak"
  "localhost:9200,Elasticsearch"
  "localhost:3000,Grafana"
)

for service in "${services[@]}"; do
  IFS=',' read -r url name <<< "$service"
  if curl -s --connect-timeout 2 "http://$url" > /dev/null 2>&1; then
    echo "✅ $name healthy ($url)"
  else
    echo "❌ $name unhealthy ($url)"
  fi
done
