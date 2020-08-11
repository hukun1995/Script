#!/usr/bin/expect -f

set timeout 3600
set dev [lindex $argv 0]
set password [lindex $argv 1]
set token [lindex $argv 2]
set date [lindex $argv 3]
#set Yester [lindex $argv 4]

#ssh到机器并将日志文件cat出来
spawn ssh kun.hu@$dev "cat /home/w/www/idss-display-cristina-gray/logs/optimum.log"
#spawn ssh kun.hu@$dev "zcat /home/w/www/idss-display-cristina-gray/logs/optimum.$date.0.log.gz"

expect {
"*yes*" { 
  send "yes\r\r\n"
  expect "*Token*"
  send "$token\r\r\n"
  expect "*Password*"
  send "$password\r\r\n"
  exp_continue
}
"*Token*" { 
  send "$token\r\r\n" 
  expect "*Password*"
  send "$password\r\r\n"  
  exp_continue 
}
"*Password*" { send "$password\r\r\n" } 
}

interact
