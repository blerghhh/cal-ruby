#!/usr/bin/env ruby

require_relative 'lib/month'
# require 'year'
# require 'day'

def standard_error_msg
  puts "Date not in acceptable format/range.\n./cal.rb [month] [year]"
end

def valid_input
  1
end

month = ARGV[0]
year = ARGV[1]
# `cal #{month} #{year}`

m = Month.new(month, year)
puts m.to_s
