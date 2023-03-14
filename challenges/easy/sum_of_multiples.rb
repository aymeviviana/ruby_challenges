=begin
GOAL:
Write a program that takes a TARGET NUMBER and a SET of one or more numbers and finds the sum of all the multiples in the set that are LESS than the first number

TESTS:
Target Number = 20
Set = [3, 4]

multiples = [3, 5, 6, 9, 10, 12, 15, 18]
sum of multiples = 78

REQUIREMENTS:
1. Define a class variable called `@@set` that points to default set[3, 5]

2. Define a `SumOfMultiples` class with the following methods:
- #initialize(*args): takes one or more integer arguments
-- reassign @@set to *args when new instance of `SumOfMultiples` is initialized

- #to(int): instance method that invokes class method ::to

- ::to(int): class method that takes a single integer argument
-- find all multiples of all numbers in set, upto but not including the target number
--- loop through each @@set integer
---- loop through each range integer from 1 through (TARGET NUM - 1)
----- if current range int is evenly divisible by current @@set int
------ append current range int to `multiples`, unless int already in multiples
----- end
---- end inner loop
--- end outer loop

-- calculate and return the sum of `multiples`
=end

# class SumOfMultiples
#   @@set = [3, 5]

#   def initialize(*set)
#     @@set = set
#   end

#   def self.to(limit)
#     multiples = []

#     @@set.each do |set_num|
#       1.upto(limit - 1) do |range_num|
#         multiples << range_num if range_num % set_num == 0    
#       end
#     end

#     set_to_default
#     multiples.uniq.sum
#   end

#   def to(limit)
#     self.class.to(limit)
#   end

#   def self.set_to_default
#     @@set = [3, 5]
#   end
# end

class SumOfMultiples
  attr_reader :set

  def initialize(*args)
    @set = args.size > 0 ? args : [3, 5]
  end

  def to(limit)
    (1...limit).select { |num| is_a_multiple?(num) }.sum
  end

  def self.to(limit)
    SumOfMultiples.new().to(limit)
  end

  private

  def is_a_multiple?(num)
    set.any? { |set_num| num % set_num == 0 }
  end
end


# p SumOfMultiples.to(20)
# sum = SumOfMultiples.new()
# p sum.set
# SumOfMultiples.to(10)