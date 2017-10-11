#! /bin/bash
# Checks used space on filesystems and reports folowwing few parameters before OS being jammed

# Warning when percentage used space max equal to :
max="95"

# Paths to filesystems to check
filesystems=(/opt/PowerCenter/10.1)

for fs in ${filesystems[*]}; do
  # Check is volume is mounted
    if grep -qs "$fs" /proc/mounts; then
      space=$(df -h | grep $fs | awk '{print $(NF-1)}' | sed 's/%//')
      if [ "$space" -ge "$max" ]; then
        echo "$fs is at "$space"%" "it's gonna a space jam !"
      else
        echo "filesystems are fine today, have fun ;)"
      fi
    fi
done
