#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/year'

def standard_error_msg
  puts "Date not in acceptable format/range.\n./cal.rb [month] [year]"
end

if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  m = Month.new(month, year)
  if !month.between?(1,12) or !year.between?(1800,3000)
    standard_error_msg
  else
    puts m.to_s
  end
elsif ARGV.length == 1
  year = ARGV[0].to_i
  y = Year.new(year)
  if !year.between?(1800,3000)
    standard_error_msg
  else
    puts y.to_s
  end
else
  standard_error_msg
end
