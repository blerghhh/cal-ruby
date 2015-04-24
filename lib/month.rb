class Month
  attr_reader :month, :year, :days_in_month

  def initialize(month, year)
    @month = month
    @year = year
  end

  def name
    months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    return months[@month.to_i.truncate - 1]
  end

  def name_padding
    case @month.to_i.truncate
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
    case @month.to_i.truncate
    when 1, 3, 5, 7, 8, 10, 12
      31
    when 4, 6, 9, 11
      30
    else
      28
    end
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
