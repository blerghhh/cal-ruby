require_relative 'year'

class Month
  attr_reader :day, :month, :year, :days_in_month

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
    @day = start_day
  end

  def name
    months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    months[@month - 1]
  end

  def name_padding
    case @month
    when 2, 9, 11..12
      " " * 3
    when 1, 8, 10
      " " * 4
    when 3, 4, 6..7
      " " * 5
    else
      " " * 6
    end
  end

  def days_in_month
    case @month
    when 1, 3, 5, 7, 8, 10, 12
      31
    when 4, 6, 9, 11
      30
    else
      @year.leap?
    end
  end

  def start_day
    # The start day of each month is derived using Zeller's Congruence (http://en.wikipedia.org/wiki/Zeller%27s_congruence). The return value 0-6 represents the day of the week the first of each month falls on, where 0 = Saturday, 1 = Sunday, etc.
    m = @month
    k = @year.year % 100
    j = @year.year / 100
    if (m < 3)
      m += 12
      k -= 1
    end
    day = (1 + (13*(m+1))/5 + k + (k/4) + (j/4) + (5*j)) % 7
  end

  def print_days
    day_output = ""
    zellers_arr = [0, 1, 2, 3, 4, 5, 6]
    line1_whitespace = 18 - (zellers_arr.reverse[start_day - 1] * 3)
    day_output << " " * line1_whitespace
    (days_in_month - 1).times do |day|
      if (day + 1) < 10
        if (day + zellers_arr[start_day]) % 7 == 0
          day_output << " #{day + 1}\n"
        else
          day_output << " #{day + 1} "
        end
      elsif (day + zellers_arr[start_day]) % 7 == 0
        day_output << "#{day + 1}\n"
      else
        day_output << "#{day + 1} "
      end
    end
    day_output << days_in_month.to_s
  end

  def to_s
    <<EOS
#{name_padding}#{name} #{year.year}
Su Mo Tu We Th Fr Sa
#{print_days}

EOS
  end

end
