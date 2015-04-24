class Month
  attr_reader :day, :month, :year, :days_in_month

  def initialize(month, year)
    @month = month.to_i.truncate
    @year = year.to_i
    @day = start_day
  end

  def name
    months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    return months[@month.to_i.truncate - 1]
  end

  def name_padding
    case @month
    when 2, 9, 11..12
      "   "
    when 1, 8, 10
      "    "
    when 3, 4, 6..7
      "     "
    else
      "      "
    end
  end

  def days_in_month
    case @month
    when 1, 3, 5, 7, 8, 10, 12
      31
    when 4, 6, 9, 11
      30
    else
      28
    end
  end

  def start_day
    m = @month
    k = @year % 100
    j = @year / 100
    if m == 1
      m = 13
      k -= 1
    elsif m == 2
      m = 14
      k -= 1
    end
    h = (1 + (13*(m+1))/5 + k + (k/4) + (j/4) + (5*j)) % 7
    return h
  end

  def print_days
    day_output = ""
    (days_in_month - 1).times do |day|
      if (day + 1) < 10
        if (day + 1) % 7 == 0
          day_output << " #{day + 1}\n"
        else
          day_output << " #{day + 1} "
        end
      elsif (day + 1) % 7 == 0
        day_output << "#{day + 1}\n"
      else
        day_output << "#{day + 1} "
      end
    end
    day_output << days_in_month.to_s
    day_output
  end

  def to_s
    <<EOS
#{name_padding}#{name} #{year}
Su Mo Tu We Th Fr Sa
#{print_days}

EOS
  end

end
