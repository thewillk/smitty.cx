#!/usr/bin/ruby

require '~/.smitty/smitty.rb'

themes = ["smitty-yellow","smitty-red","smitty-blue","smitty-green","smitty-white","smitty-aqua","smitty-orange","smitty-purple"]
terminal = Smitty::Terminal.new

n = terminal.number_of_open_tabs
terminal.set_current_window_to_theme themes[(Integer(n)-1)%themes.length]
