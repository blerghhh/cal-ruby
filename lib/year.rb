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
      (m != row.last) ? output << "#{m.name.center(20)}\s\s" : output << "#{m.name.center(20).rstrip}\n"
    end
    output
  end

  def print_month_lines(row)
    output = ""
    7.times do |n|
      output << print_single_line(row, n)
    end
    output
  end

  def print_single_line(row, n)
    output = ""
    row.each do |m|
      output << print_line_for_month(m, row, n)
    end
    output
  end

  def print_line_for_month(m, row, n)
    output = ""
    if !m.print_days.lines[n].nil?
        if m != row.last
          output << "#{m.print_days.lines[n].chomp.ljust(22)}"
        else
          output << "#{m.print_days.lines[n].rstrip}\n"
        end
    else
      if m != row.last
        output << "#{(" " * 22).chomp.ljust(22)}"
      else
        output << "\n"
      end
    end
    output
  end

  def to_s
    output = @header
    months_array.each_slice(3) do |row|
    output << month_names(row)
    output << print_month_lines(row)
    end
    output
  end
end
