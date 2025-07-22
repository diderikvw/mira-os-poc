#!/bin/bash
echo "🏗️  Starting MIRA Local Setup..."

# Start services in order
docker compose up -d kong-database elasticsearch
sleep 10

docker compose up -d kong-migration
sleep 5

docker compose up -d kong keycloak nats
sleep 10

docker compose up -d kibana grafana prometheus
sleep 10

docker compose up -d mock-ind-service mock-gemeente-service swagger-ui

echo "✅ MIRA services started!"
echo ""
echo "🌐 Access points:"
echo "- Kong API Gateway:     http://localhost:7000"
echo "- Kong Admin API:       http://localhost:7001" 
echo "- Keycloak:             http://localhost:8080 (admin/admin123)"
echo "- Kibana:               http://localhost:5601"
echo "- Grafana:              http://localhost:3000 (admin/admin123)"
echo "- NATS Monitor:         http://localhost:8222"
echo "- Swagger UI:           http://localhost:8090"
echo "- Mock IND Service:     http://localhost:8010"
echo "- Mock Gemeente:        http://localhost:8011"
echo "- Prometheus:           http://localhost:9090"
echo ""
echo "⏱️  Wait ~2 minutes for all services to be fully ready"
echo "🧪 Run: ./examples/test-apis.sh to test the setup"
