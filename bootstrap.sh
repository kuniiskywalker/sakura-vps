#!/usr/bin/env bash

# Exit if already bootstrapped
test -f /etc/bootstrapped && exit

sudo /etc/init.d/vboxadd setup

date > /etc/bootstrapped