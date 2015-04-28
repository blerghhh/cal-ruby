require_relative 'month'

class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap?
    if (@year % 4 == 0)
      if (@year % 100 == 0) and (@year % 400 != 0)
        return 28
      else
        return 29
      end
    else
      return 28
    end
  end

  def to_s
    year_output = ""
    year_arr    = []
    12.times {|month| year_arr.push(Month.new((month + 1), @year)) }
    year_output << "#{year.to_s.center(63).rstrip}\n\n"
    year_arr.each_slice(3) do |month|
      year_output << <<EOS
#{month[0].name.center(20)}  #{month[1].name.center(20)}  #{month[2].name.center(20).rstrip}
EOS
      line_num = 0
      while line_num < 7
        month.each do |single|
          if !single.print_days.lines[line_num].nil?
            if single.print_days.lines[line_num] == single.print_days.lines.last
              if single != month.last
                year_output << "#{single.print_days.lines[line_num].chomp.ljust(22)}"
              else
                  year_output << "#{single.print_days.lines[line_num].chomp.ljust(22).rstrip}\n"
              end
            else
              if single != month.last
                year_output << "#{single.print_days.lines[line_num].chomp.ljust(22)}"
              else
                year_output << "#{single.print_days.lines[line_num].chomp.ljust(22).rstrip}\n"
              end
            end
          else
            if single != month.last
              year_output << "#{(" " * 22).chomp.ljust(22)}"
            else
              year_output << "\n"
            end
          end
        end
        line_num += 1
      end
    end
    year_output
  end
end
