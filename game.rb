#!/usr/bin/env ruby
require 'tty-prompt'

words = []
File.open("./words.txt", "r") do |f|
  f.each_line do |line|
    words << line.chop
  end
end

prompt = TTY::Prompt.new
point = 0
while (answer = prompt.ask("Tebak kata: #{words.sample.split("").shuffle.join}")) != 'exit'
  if words.include? answer
    point += 1
    puts "BENAR point anda: #{point}!"
  else
    puts "SALAH! Silahkan coba lagi"
  end
end