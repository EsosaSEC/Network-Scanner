# Network Scanner

A bash script to detect suspicious open ports (e.g., 23, 445, 3389) and connections to known malicious IPs listed in your `malicious_ips_file`. Alerts are logged to a specified file.

## Usage
1. Ensure `config.sh` with `SUSPICIOUS_PORTS`, `MALICIOUS_IPS_FILE`, and `ALERTS_LOG`.
2. Populate `malicious_ips_file` with IPs from [AbuseIPDB](https://www.abuseipdb.com) (API with 90%+ confidence score).
   ```bash
   curl -G https://api.abuseipdb.com/api/v2/blacklist \
   -d confidenceMinimum=90 \
   -d plaintext \
   -H "Key: YOUR_API_KEY" \
   -H "Accept: text/plain" > malicious_ips.txt
   ```
3. Run:
   ```bash
   sudo ./network_scan.sh
   ```
4. Check alerts in the log file.

## Dependencies
- ss or netstat, grep.

## Example Alert
   ```bash
   [2025-07-11 11:17:00] ALERT: Suspicious port 445 open
[2025-07-11 11:17:00] ALERT: Connection to known malicious IP 192.168.1.30 detected
   ```
## Notes
- Uses AbuseIPDB’s blacklist API for malicious IPs.
