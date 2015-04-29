require_relative 'year'
require_relative 'day'

class Month
  attr_reader :day, :month, :year

  def initialize(month, year)
    @month        = month
    @year         = year
    @day          = Day.new(@month, @year).start_day
    @zellers_arr  = (0..6).to_a
    @month_header = "#{"#{name} #{year}".center(20).rstrip}"
  end

  def name
    months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    months[@month - 1]
  end

  def days_in_month
    case @month
    when 1, 3, 5, 7, 8, 10, 12
      31
    when 4, 6, 9, 11
      30
    else
      Year.new(@year).leap
    end
  end

  def days
    line1_whitespace = 18 - (@zellers_arr.reverse[@day - 1] * 3)
    day_output = "Su Mo Tu We Th Fr Sa\n"
    day_output << " " * line1_whitespace
    (days_in_month - 1).times do |day|
      if (day + @zellers_arr[@day]).modulo(7).zero?
        day_output << "#{day + 1}\n".rjust(3)
      else
        day_output << "#{day + 1}\s".rjust(3)
      end
    end
    day_output << "#{days_in_month.to_s}\n"
  end

  def to_s
    <<EOS
#{@month_header}
#{days}
EOS
  end

end
