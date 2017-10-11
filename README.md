# spacejam
Bash shell script to checks used space on filesystems and reports before OS being jammed

## Requirements

- Grep
- Awk
- Sed

## Variables

* 'maxlimit' - Percentage value between 0-100. If the used space in any of the listed filesystems exceeds the value choosen, sends a WARNING message to the user

* 'minlimit' - Percentage value between 0-100. If the used space in any of the listed filesystems exceeds the value choosen, sends a NOTIFICATION message to the user

* 'filesystems' - Array of strings containing the mount points of the filesystems to check
