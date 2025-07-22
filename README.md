# MIRA Federatieve Gegevensuitwisseling - Proof of Concept

**Open Source-gebaseerd Proof-of-Concept voor federatieve gegevensuitwisseling gebaseerd op MIRA Migratieketen Architectuur**

---

## Overzicht

Deze container-gebaseerde opstelling biedt een Proof-of-Concept (PoC) voor federatieve gegevensuitwisseling, geïnspireerd door de MIRA Migratieketen Architectuur. Het systeem combineert verschillende open source componenten voor event streaming, API-gateway, identiteit & toegangsbeheer, logging, API-documentatie en monitoring.

Het doel is een robuuste en schaalbare basis te bieden voor het uitwisselen van gegevens tussen verschillende domeinen en organisaties, met nadruk op veiligheid, transparantie en flexibiliteit.

---

## Architectuur

De PoC bestaat uit de volgende hoofdcomponenten, georkestreerd met Docker Compose:

1. **Event Hub - NATS JetStream**
   Zorgt voor cloud-native event streaming (CloudEvents compatible) en event persistence.

2. **API Gateway - Kong**
   Beheer van API-verkeer, authenticatie, autorisatie en load balancing.

3. **Identity & Access Management - Keycloak**
   Centraal beheer van gebruikers, authenticatie en rollen.

4. **Logging - ELK Stack (Elasticsearch & Kibana)**
   Centrale logging en visualisatie van systeemlogs.

5. **Mock Services (IND en Gemeente)**
   Voorbeeld API services voor het simuleren van gegevensbronnen.

6. **API Documentatie - Swagger UI**
   Interactieve API-documentatie en testing interface.

7. **Monitoring - Prometheus & Grafana**
   Metrics verzamelen en dashboards voor systeemmonitoring.

---

## Gebruik

### Vereisten

- Docker 20.10+
- Docker Compose plugin (gebruik `docker compose`)

### Starten

Start de omgeving via het meegeleverde startscript:

```bash
./scripts/start.sh
```

Dit script voert `docker compose up -d` uit en zorgt dat alle services opgestart worden.

### Toegang

```
- Kong API Gateway:     http://localhost:7000
- Kong Admin API:       http://localhost:7001
- Keycloak:             http://localhost:8080 (admin/admin123)
- Kibana:               http://localhost:5601
- Grafana:              http://localhost:3000 (admin/admin123)
- NATS Monitor:         http://localhost:8222
- Swagger UI:           http://localhost:8090
- Mock IND Service:     http://localhost:8010
- Mock Gemeente:        http://localhost:8011
- Prometheus:           http://localhost:9090
```

---

## MIRA Migratie Architectuur

Dit PoC-project is gebaseerd op de principes van de MIRA Migratieketen Architectuur, gericht op veilige, schaalbare en federatieve gegevensuitwisseling tussen verschillende partijen. Het stelt organisaties in staat om op een gestandaardiseerde en gecontroleerde manier data te delen zonder directe afhankelijkheid van centrale systemen.

Bezoek de officiële website van de MIRA Migratieketen Architectuur: [MIRA Online](https://miraonline.nl).
