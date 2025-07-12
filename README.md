# Network Scanner

A bash script to detect suspicious open ports (e.g., 23, 445, 3389) and connections to known malicious IPs listed in `malicious_ips.txt`. Alerts are logged to a specified file.

## Usage
1. Ensure `config.sh` with `SUSPICIOUS_PORTS`, `MALICIOUS_IPS_FILE`, and `ALERTS_LOG`.
2. Run:
   ```bash
   sudo ./network_scan.sh
   ```
3. Check alerts in the log file.

## Dependencies
- ss or netstat, grep.

## Example Alert
   ```bash
   [2025-07-11 11:17:00] ALERT: Suspicious port 445 open
[2025-07-11 11:17:00] ALERT: Connection to known malicious IP 192.168.1.30 detected
   ```
