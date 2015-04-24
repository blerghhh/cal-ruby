#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/year'

def standard_error_msg
  puts "Date not in acceptable format/range.\n./cal.rb [month] [year]"
end

month = ARGV[0].to_i
year = ARGV[1].to_i
# `cal #{month} #{year}`

m = Month.new(month, year)

# if (ARGV[0].nil? or ARGV[1].nil? or (ARGV[0] != (1..12)) or (ARGV[1] != (1800..3000)))
if !month.between?(1,12) or !year.between?(1800,3000)
  standard_error_msg
else
  puts m.to_s
end
