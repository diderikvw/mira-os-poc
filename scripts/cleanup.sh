#!/bin/bash
echo "🧹 Cleaning up MIRA Local Setup..."
docker-compose down -v
docker system prune -f
echo "✅ Cleanup completed!"
