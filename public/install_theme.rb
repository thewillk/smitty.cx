#!/usr/bin/ruby

require '~/.smitty/smitty.rb'

theme_path = ARGV[0]
terminal = Smitty::Terminal.new
terminal.install_theme! theme_path

puts "Installed "+theme_path
