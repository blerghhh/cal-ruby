require_relative 'month'

class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap?
    ((@year % 4 != 0) or ((@year % 100 == 0) and (@year % 400 != 0))) ? 28 : 29
  end

  def to_s
    year_output = ""
    year_arr    = []
    12.times {|month| year_arr.push(Month.new((month + 1), @year)) }
    year_output << "#{year.to_s.center(63).rstrip}\n\n"
    year_arr.each_slice(3) do |month_row|
      year_output << <<EOS
#{month_row[0].name.center(20)}  #{month_row[1].name.center(20)}  #{month_row[2].name.center(20).rstrip}
EOS
      7.times do |n|
        month_row.each do |month|
          if !month.print_days.lines[n].nil?
              if month != month_row.last
                year_output << "#{month.print_days.lines[n].chomp.ljust(22)}"
              else
                year_output << "#{month.print_days.lines[n].rstrip}\n"
              end
          else
            if month != month_row.last
              year_output << "#{(" " * 22).chomp.ljust(22)}"
            else
              year_output << "\n"
            end
          end
        end
      end
    end
    year_output
  end
end
