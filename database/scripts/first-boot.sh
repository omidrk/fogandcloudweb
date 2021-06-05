#!/bin/bash

echo "hello world"
sudo apt update
sudo apt install -y mongodb
sudo tee /etc/mongod.conf << EOF
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo
net:
  port: 27017
  bindIp: 0.0.0.0 # <-- TODO: Exposes MongoDB to Public IP. Please use internal IPs instead
# security:
#   authorization: enabled
#   keyFile: /var/lib/mongo/private/keyfile
#   sasl:
#     hostName: mdb01.mdbkrb5.net
# replication:
#   replSetName: rs0
# setParameter:
#   authenticationMechanisms: GSSAPI,SCRAM-SHA-256
EOF
