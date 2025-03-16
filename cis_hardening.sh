#!/bin/bash

echo "Applying CIS Security Hardening..."

# Disable root SSH login
echo "Disabling root login over SSH..."
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# Set password policies
echo "Setting password policies..."
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   7/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   14/' /etc/login.defs

# Disable unused services
echo "Disabling unused services..."
systemctl disable avahi-daemon cups telnet

echo "CIS Hardening Applied Successfully!"

