#!/usr/bin/ruby

theme = ARGV[0]

# THERE'S GOTTA BE A BETTER WAY....

`open #{theme}`

sleep 0.5

`osascript -e 'tell application "Terminal" to close the first window'`

puts "Installed "+theme
