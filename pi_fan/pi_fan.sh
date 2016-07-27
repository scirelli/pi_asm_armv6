#!/bin/bash
/opt/vc/bin/vcgencmd measure_temp | /home/pi/Projects/pi/pi_fan/pi_fan /etc/pi_fan/pi_fan.conf
