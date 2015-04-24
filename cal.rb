#!/usr/bin/env ruby

require_relative 'lib/month'
# require 'year'
# require 'day'

def standard_error_msg
  puts "Date not in acceptable format/range.\n./cal.rb [month] [year]"
end

month = ARGV[0].to_i
year = ARGV[1].to_i
# `cal #{month} #{year}`

m = Month.new(month, year)
puts m.to_s
