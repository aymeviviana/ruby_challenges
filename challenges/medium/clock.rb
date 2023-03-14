=begin
GOAL:

REQUIREMENTS:

- class: `Clock`

- method: ::at (class method)
- input: 1 required argument, 1 optional arg that defaults to 0
- output: Clock object with @hour and @minutes instance variables that correspond to values passed in during instatiation
- clock object should follow military time
-- 0 = 0
-- 1 = 1
-- 10 = 10
-- 12 = 12
-- 13 = 13
- algorithm:
1. return a new instance of the `Clock` class where @hour is set to first argument and @minutes is assigned to second argument. @minutes should be assigned to 0 if second argument not present. 

- method: #to_s
- input: none
- output: string that represents the values passed into Clock::at in time format (i.e. 11 and 9 should return "11:09")
- rules:
- test: 
-- Clock.at(10) should return "10:00"
-- Clock.at(14:25) should return "14:25"
-- Clock.at(0) should return "00:00"
- algorithm:
-- format("%02d:%02d", hours, minutes)

- method: #+
- input: integer
- output: string that represents new time according to number of minutes that were added to the clock
- rules:
-- if current number of minutes plus number of minutes added exceeds 59, increment @hour and start counting minutes from zero
- test:
- algorithm:
1. init `total_minutes` var, assign to @min PLUS input integer
2. invoke #calculate_time and pass `total_minutes` as argument

- method: #-
- input: integer
- output: same clock object
- rules:
-- if current number of minutes minus number of minutes subtracted is less than 0, decrement @hour by 1 and and subtract remainder minutes from 60
- test: 10:05 - 10 => 09:55
- test: 10:05 - 5 => 10:00
- test: 10:05 - 6 => 09:59
- test: 10:05 - 70 => 08:55
- algorithm:
1. init `total_minutes` var, assign to @min MINUS input integer
2. invoke #calculate_time and pass `total_minutes` as argument

- method: #calculate_time
- input: integer representing total minutes
- output: array containing 2 integers representing hour and minutes
- rules:
- test:
- algorithm:

-- if `total_minutes` is less than 0
--- increment `total_minutes` by 1440 until it is greater than 0
--- divide resulting number by 60 and save dividend and remainder to var called `time_array`
--- return `time_array`

-- if `total_minutes` is greater than 1440
--- reduce `total_minutes` by 1440 until `total_minutes` is less than 1440
--- divide resulting number by 60, save dividend and remainder to array
--- return array

- method: #==
- input: clock object
- output: boolean value
- rules: returns true of @hours hours @minutes values are same for both clock objects 
- test:
- algorithm: 
=end

class Clock
  attr_accessor :hour, :min

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min=0)
    Clock.new(hour, min)
  end

  def to_s
    format("%02d:%02d", @hour, @min)
  end

  def +(added_time)
    new_clock = Clock.new(self.hour, self.min)
    total_minutes = (hour * 60) + min + added_time
    time_array = calculate_time(total_minutes)
    
    new_clock.hour = time_array.first
    new_clock.min = time_array.last
    new_clock
  end

  def -(subtracted_time)
    new_clock = Clock.new(self.hour, self.min)
    total_minutes = (hour * 60) + min - subtracted_time
    time_array = calculate_time(total_minutes)
    
    new_clock.hour = time_array.first
    new_clock.min = time_array.last
    new_clock
  end

  def calculate_time(total_minutes)
    if total_minutes < 0
      total_minutes += 1440 until total_minutes >= 0
    elsif total_minutes > 1440
      total_minutes -= 1440 until total_minutes <= 1440
    end
      
    time_array = total_minutes.divmod(60)
    time_array[0] = 0 if time_array.first == 24
    time_array
  end

  def ==(other_clock)
    hour == other_clock.hour && min == other_clock.min
  end
end

# clock = Clock.new(23, 30)
# p clock + 125

