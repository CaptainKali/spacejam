#! /bin/bash
# Checks used space on filesystems and reports folowwing few parameters before OS being jammed

# Warning when percentage used space max equal to :
maxlimit="90"

# Notify when percentage used space reach low limit :
lowlimit="80"

# Paths to filesystems to check
filesystems=(/dev /usr /opt /home)

for fs in ${filesystems[*]}; do
  # Check is volume is mounted
    if grep -qs "$fs" /proc/mounts; then
      space=$(df -h | grep $fs | awk '{print $(NF-1)}' | sed 's/%//')
      if [ "$space" -ge "$maxlimit" ]; then
        echo "`date +%Y-%m-%d`: This is automatic message.
        We are running out of disc space in "$HOSTNAME".
        $fs is at "$space"%" "it's gonna be a space jam !
        Cleaning/packing of old files needed IMMEDIATELY." | mail -s "WARNING - Filesystem" test@example.com
        exit
      fi
      if [ "$space" -ge "$lowlimit" ]; then
        echo "`date +%Y-%m-%d`: This is automated message.
        We have only $space disc space left on "$HOSTNAME".
        $fs is fine today but cleaning/packing old files is suggested." | mail -s "NOTIFICATION - Filesystem" test@example.com
        exit
      fi
    fi
done
