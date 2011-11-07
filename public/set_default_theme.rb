#!/usr/bin/ruby

require '~/.smitty/smitty.rb'

theme_name = ARGV[0]
terminal = Smitty::Terminal.new

terminal.set_default_theme! theme_name
