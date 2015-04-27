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
    year_output << "#{year.to_s.center(63).rstrip}\n\n"

    this_array = []
    12.times {|month| this_array.push(Month.new((month + 1), @year)) }

    this_array.each_slice(3) do |month|
      year_output << <<EOS
#{month[0].name.center(20)}  #{month[1].name.center(20)}  #{month[2].name.center(20).rstrip}
#{month[0].print_days.lines[0].chomp}  #{month[1].print_days.lines[0].chomp}  #{month[2].print_days.lines[0].chomp}
#{month[0].print_days.lines[1].chomp}  #{month[1].print_days.lines[1].chomp}  #{month[2].print_days.lines[1].chomp}
#{month[0].print_days.lines[2].chomp}  #{month[1].print_days.lines[2].chomp}  #{month[2].print_days.lines[2].chomp}
#{month[0].print_days.lines[3].chomp}  #{month[1].print_days.lines[3].chomp}  #{month[2].print_days.lines[3].chomp}
#{month[0].print_days.lines[4].chomp}  #{month[1].print_days.lines[4].chomp}  #{month[2].print_days.lines[4].chomp}
#{month[0].print_days.lines[5].ljust(20).chomp}  #{month[1].print_days.lines[5].ljust(20).chomp}  #{month[2].print_days.lines[5].ljust(20).chomp}
EOS

      month.each do |single|
        if !single.print_days.lines[6].nil?
          year_output << "#{single.print_days.lines[6].ljust(20).chomp}"
        else
          year_output << "#{(" " * 22).chomp}"
        end

      end #end of month.each
      year_output << "\n"

    end # end of each_slice

    print year_output
  end

end
