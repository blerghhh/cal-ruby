class Day
  attr_reader :start_day

  def initialize(month, year)
    @month = month
    @year = year
  end

  def start_day
    # The start day of each month is derived using Zeller's Congruence (http://en.wikipedia.org/wiki/Zeller%27s_congruence). The return value 0-6 represents the day of the week the first of each month falls on, where 0 = Saturday, 1 = Sunday, etc.
    m = @month
    k = @year % 100
    j = @year / 100
    if (m < 3)
      m += 12
      k = (@year - 1) % 100
      j = (@year - 1) / 100
    end
    day = (1 + (13*(m+1))/5 + k + (k/4) + (j/4) + (5*j)) % 7
  end
  
end
