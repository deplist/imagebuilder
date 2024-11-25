#!/bin/bash

## Enable debugging for this bash script
set -x

## Test writing a file with a starting time stamp
date > /var/tmp/ib-test.txt
echo "Hello, world!" >> /var/tmp/ib-test.txt

## Set our hostname
hostnamectl set-hostname ""

## Testing a log message to the journal
## View later with `journalctl -t bootup_script`
logger -t bootup_script "This is a test message from the bootup script!"

## Test that the system registered correctly
## 2>&1 captures of stout and sterr
subscription-manager status >> /var/tmp/ib-test.txt 2>&1

## View the systemd service status
systemctl status custom-first-boot >> /var/tmp/ib-test.txt 2>&1

## Final time stamp
date >> /var/tmp/ib-test.txt
