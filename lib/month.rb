class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def name
    months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    return months[@month.truncate - 1]
  end

  def padding
    case @month.truncate
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

  def to_s
    <<EOS
#{padding}#{name} #{year}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

end
