#!/usr/bin/env bash

$hostname = hostname

cat >> /etc/systemd/system/vityl-collector.service.d/override.conf <<EOL
[Service]
User=root
Group=root
Environment=VCM_GUID_TYPE=host 
EOL

chmod 644 /etc/systemd/system/vityl-collector.service.d/override.conf
chown -R root:root /etc/systemd/system/vityl-collector.service.d/override.conf
systemctl start vityl-collector
systemctl enable vityl-collector
