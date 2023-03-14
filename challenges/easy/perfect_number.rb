=begin
GOAL:
Write a program that can tell whether a number is perfect, abundant, or deficient.

REQUIREMENTS:
- perfect: number's divisors add up to the orignial number exactly
- abundant: number's divisors add up to MORE than the orignial number
- deficient: number's divisors add up to LESS than the orignial number
- DIVISORS are any numbers from 1 upto (but not including) the number that can be evenly divided into the target number without a reminder
-- example: [1, 2, 3] are divisors of 6
-- example: [1, 2, 6, 9] are divisors of 18
- create a `PerfectNumber` class with the following instance methods:
-- #initialize
-- ::classify
--- should be a class method, NOT an instance method
--- raise a StandardError when a number less than 0 is passed in as an argument
--- return one of three lower case strings ('perfect', "abundant", 
"deficient") based on the kind of number it is


ALGORITHM:

- create a `PerfectNumber` class with the following instance methods:
-- #initialize
-- ::classify (should be a class method, NOT an instance method)


*** raise a StandardError if NUMBER is less than 0 

1. Generate a list of the number's divisors, not including NUMBER
- init empty array called `divisors`
- loop from 1 to (NUMBER - 1), store current number in `num`
-- if NUMBER is evenly divisible by `num`
--- append num to `divisors`
--else
--- move onto the next `num` in loop
--end
- end loop

2. Calculate the sum of the number's divisors
- init a var called `sum_of_divisors` and assign it to the sum of all numbers in `divisors`

3. Return a string based on comparison between sum of divisors and original number
- return "perfect" if `sum_of_divisors` is equal to NUMBER
- return "abundant" if `sum_of_divisors` is greater than NUMBER
- return "deficient" if `sum_of_divisors` is less than NUMBER
=end

class PerfectNumber
  def initialize(number)
    PerfectNumber.classify(number)
  end

  def self.classify(number)
    raise StandardError if number < 0

    divisors = generate_divisors(number)

    sum_of_divisors = divisors.sum

    case sum_of_divisors <=> number
    when -1 then "deficient"
    when 0 then "perfect"
    when 1 then "abundant"
    end
  end

  class << self
    private 
    def generate_divisors(number)
      list_of_divisors = (1...number).select { |n| number % n == 0 }
    end
  end
end

# PerfectNumber.classify(12)

# p PerfectNumber.generate_divisors(16)