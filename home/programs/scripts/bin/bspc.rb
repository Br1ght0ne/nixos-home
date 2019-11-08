#!/usr/bin/env ruby

property, value, _type = ARGV

current = `bspc config #{property}`.chomp

new = case value[0]
      when '+'
        current.to_i + value[1..-1].to_i
      when '-'
        current.to_i - value[1..-1].to_i
      else
        value
      end

system("bspc config #{property} #{new}")
