#!/usr/bin/expect -f

        set timeout 20

        set IPaddress [lindex $argv 0]

        set Username "Skylar"

        set Password "Skylar's Password"

        set Directory /home/networks/SkyeTest/bash/ShutdownInterfaceOnCiscoBoxUsingShellScript/logs

        log_file -a $Directory/session_$IPaddress.log

        send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"

        spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress

        expect "*assword: "

        send "$Password\r"

        expect "#"

        send "conf t\r"

        expect "(config)#"

        send "int g0/0\r"

        expect "(config-if)#"

        send "shut\r"

        expect "(config-if)#"

        send "exit"

        expect "(config)#"

        send "exit"

        expect "#"

        send "wr mem\r"

        expect "#"

        send "exit\r"

        sleep 1

        send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"



exit
