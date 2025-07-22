#!/bin/bash
echo "☁️  CloudEvents NATS Demo"

# Install NATS CLI if not present
if ! command -v nats &> /dev/null; then
    echo "Installing NATS CLI..."
    curl -sf https://binaries.nats.dev/nats-io/nats/v2/install.sh | sh
    export PATH=$PATH:$HOME/.nats/bin
fi

# Create JetStream stream
nats --server=localhost:4222 stream add MIRA --subjects="mira.events.>" --retention=limits --max-age=24h

# Subscribe to events
echo "Starting event subscriber (press Ctrl+C to stop)..."
nats --server=localhost:4222 sub "mira.events.verblijfsstatus" &
SUB_PID=$!

sleep 2

# Send a CloudEvents message
echo "Sending CloudEvent..."
cat << EVENT | nats --server=localhost:4222 pub mira.events.verblijfsstatus
{
  "specversion": "1.0",
  "type": "nl.mira.verblijfsstatus.changed",
  "source": "https://ind.nl/api/v2",
  "id": "$(uuidgen)",
  "time": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "datacontenttype": "application/json",
  "subject": "BSN:123456789",
  "data": {
    "bsn": "123456789",
    "oude_status": "aanvraag_ingediend",
    "nieuwe_status": "in_behandeling",
    "behandelaar": "medewerker@ind.nl"
  }
}
EVENT

sleep 2
kill $SUB_PID

echo "✅ CloudEvent demo completed"
