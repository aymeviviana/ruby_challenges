require "date"

=begin
GOAL:

class: `Meetup`

method: #initialize(year, month)
input: year and month (both integers)
output:
rules:
test:
algorithm:

method: #day 

input: two strings, weekday and schedule, where schedule can either be first, second, third, fourth, fifth, last or teenth

output: Date object containing exact month, day and year corresponding to the weekday and schedule inputs passed to #day

rules:
- weekday and schedule inputs should be case insensitive (i.e. `monday` is same as `Monday` and `first` is same as `FIRST`)

- `teenth` refers to a day that ends in "teenth" (i.e 13th - 19th). So if weekday is "Monday" and schedule is "teenth" program should return whichever day, between 13th and 19th, falls on a Monday. 

algorithm:
1. convert weekday input into a number from 0-6 (0=sun...6=sat), assign weekday number to var `weekday_num`

2. init a `days` var, assign to empty array. we'll use this to collect all days that match `weekday_num`

3. collect all days in month that correspond to `weekday_num`
- loop through each day in month (while month is equal to month input..)
-- append current day object to `days` if invoking #wday on current day returns integer equal to `weekday_num`

4. select the day in `days` that corresponds to `schedule`
- if `schedule` is `first`, then return the element in `days` at idx 0
- if `schedule` is `second`, then return the element in `days` at idx 1
...
- if `schedule` is `last`, then return the element in `days` at last index
- if `schedule` is `teenth`, then run the find_teenth helper method, pass `days` as argument

5. find_teenth
input: array called `days` that contains all relevant weekdays
output: the day that ends in `teenth`

- loop through `days`
-- if current day contains a day number included in this array [13, 14, 15, 16, 17, 18, 19], return the current day
=end

class Meetup
  attr_reader :year_num, :month_num

  def initialize(year, month)
    @year_num = year
    @month_num = month
  end

  def day(weekday, schedule)
    days_in_month = Date.new(year_num, month_num, -1).day

    date = Date.new(year_num, month_num, 1)
    target_weekday_num = convert_to_num(weekday)
    days = []
    
    days_in_month.times do
      days << date if date.wday == target_weekday_num
      date = date.next
    end

    select_scheduled_date(schedule, days)
  end

  def convert_to_num(weekday)
    case weekday.downcase
    when "sunday" then 0
    when "monday" then 1
    when "tuesday" then 2
    when "wednesday" then 3
    when "thursday" then 4
    when "friday" then 5
    when "saturday" then 6
    end
  end

  def select_scheduled_date(schedule, days)
    case schedule.downcase
    when "first" then days[0]
    when "second" then days[1]
    when "third" then days[2]
    when "fourth" then days[3]
    when "fifth" then days[4]
    when "last" then days.last
    when "teenth" then select_teenth_day(days)
    end
  end

  def select_teenth_day(days)
    teenths = (13..19).to_a 
    days.each { |day_obj| return day_obj if teenths.include?(day_obj.day) }
  end
end

meetup = Meetup.new(2023, 3)
meetup.day("friday", "first")
