#!/bin/bash

grep -rsh "^ACPI" /var/log >errors.log
grep '/.*' errors.log
