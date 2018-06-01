#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=85
bigfiles=$(find /home -size +50M) 

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'subject' to@adres << EOF
The hard disk of the server has the following in use: $ CURRENT%

If files larger than 50MB are found by the script, they are shown here:

$bigfiles%
EOF

fi
