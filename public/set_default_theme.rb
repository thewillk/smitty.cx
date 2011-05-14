#!/usr/bin/ruby

theme = ARGV[0]

`osascript -e 'tell application "Terminal" to set default settings to first settings set whose name is "#{theme}"'`
