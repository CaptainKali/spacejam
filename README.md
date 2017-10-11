# spacejam
Bash shell script to checks used space on filesystems and reports before OS being jammed

## Requirements

- Grep
- Awk
- Sed

## Variables

* 'max' - Percentage value between 0-100. If the used space in any of the listed filesystems exceeds the value choosen, a message will be report to the user
* 'filesystems' - Array of strings containing the mount points of the filesystems to check
