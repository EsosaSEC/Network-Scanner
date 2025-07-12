#!/bin/bash

# Network connection scanner
source ./config.sh

# Check for netstat or ss
if command -v ss >/dev/null; then
    NET_TOOL="ss -tuln"
elif command -v netstat >/dev/null; then
    NET_TOOL="netstat -tuln"
else
    echo "Error: Neither ss nor netstat found"
    exit 1
fi

# Check suspicious ports
for port in $SUSPICIOUS_PORTS; do
    if $NET_TOOL | grep -q ":$port "; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ALERT: Suspicious port $port open" >> "$ALERTS_LOG"
    fi
done

# Check connections to malicious IPs
if [ -f "$MALICIOUS_IPS_FILE" ]; then
    while IFS= read -r ip; do
        if netstat -tunp | grep -q "$ip"; then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] ALERT: Connection to known malicious IP $ip detected" >> "$ALERTS_LOG"
        fi
    done < "$MALICIOUS_IPS_FILE"
fi
