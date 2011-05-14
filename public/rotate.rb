#!/usr/bin/ruby

themes = ["smitty-blue","smitty-red","smitty-green","smitty-white","smitty-aqua","smitty-orange","smitty-yellow","smitty-purple"]

n = `osascript -e 'tell application "Terminal" to get the index of the last window'`
`osascript -e 'tell application "Terminal" to set current settings of front window to first settings set whose name is "#{themes[(Integer(n)-1)%themes.length]}"'`

