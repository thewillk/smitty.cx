#!/usr/bin/ruby

theme = ARGV[0]

`open #{theme}`

sleep 0.1

`osascript -e 'tell application "Terminal" to close the first window'`

puts "Installed "+theme