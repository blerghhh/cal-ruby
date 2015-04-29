require_relative 'month'

class Year
  attr_reader :year

  def initialize(year)
    @year   = year
    @header = "#{year.to_s.center(63).rstrip}\n\n"
  end

  def leap
    ((!@year.modulo(4).zero?) or ((@year.modulo(100).zero?) and (!@year.modulo(400).zero?))) ? 28 : 29
  end

  def months_array
    arr = []
    12.times {|month| arr.push(Month.new((month + 1), @year)) }
    arr
  end

  def month_names(row)
    output = ""
    row.each do |m|
      m == row.last ? output << "#{m.name.center(20).rstrip}\n" : output << "#{m.name.center(20)}\s\s"
    end
    output
  end

  def month_dates(row)
    output = ""
    7.times do |line|
      output << print_row(row, line)
    end
    output
  end

  def print_row(row, line)
    output = ""
    row.each {|m| output << print_line(m, row, line)}
    output
  end

  def print_line(m, row, line)
    output = ""
    unless m.days.lines[line].nil?
      if m != row.last
        output << "#{m.days.lines[line].chomp.ljust(22)}"
      else
        output << "#{m.days.lines[line].rstrip}\n"
      end
    else
      m == row.last ? output << "\n" : output << "#{("\s" * 22).chomp.ljust(22)}"
    end
    output
  end

  def to_s
    output = @header
    months_array.each_slice(3) do |row|
      output << month_names(row)
      output << month_dates(row)
    end
    output
  end
end
