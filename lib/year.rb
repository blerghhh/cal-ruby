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

  def print_month_lines(month_row)
    output = ""
    7.times do |n|
      output << print_single_line(month_row, n)
    end
    output
  end

  def print_single_line(month_row, n)
    output = ""
    month_row.each do |month|
      if !month.print_days.lines[n].nil?
          if month != month_row.last
            output << "#{month.print_days.lines[n].chomp.ljust(22)}"
          else
            output << "#{month.print_days.lines[n].rstrip}\n"
          end
      else
        if month != month_row.last
          output << "#{(" " * 22).chomp.ljust(22)}"
        else
          output << "\n"
        end
      end
    end
    output
  end

  def to_s
    year_output = @header
    months_array.each_slice(3) do |month_row|
    year_output << month_names(month_row)
    year_output << print_month_lines(month_row)
    end
    year_output
  end
end
