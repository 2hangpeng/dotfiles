#!/usr/bin/expect -f

#等待30秒无操作退出
set timeout 30

# use ssh login your jump server
spawn ssh [lindex $argv 1]@[lindex $argv 0]
# start expect 
expect {
        "*yes/no*?"
        {send "yes\r";exp_continue;}
        "*assword:*"
        { send "[lindex $argv 2]\r" }
}
interact
