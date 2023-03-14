=begin
GOAL:
Implement a class that takes octal numbers and converts them into decimal numbers


TEST:
- Octal 17 == Decimal 15
-- (1 x 8**1) + (7 * 8**0)
-- 8 + 7 == 15

- Octal 1 == Decimal 1
-- 1 * 8**0 => 1

- Octal 10 == Decimal 8
-- (1 x 8**1) + (0 x 8**0)
-- 8 + 0 => 8

- Octal 130 == Decimal 88
-- (1 x 8**2) + (3 x 8**1) + (0 x 8**0)
-- 64 + 24 + 0 => 88

- octal 9 == invalid octal


REQUIREMENTS:

Implement a class called `Octal` with the following instance methods

- #initialize: takes a single string argument that represents an octal number

- #to_decimal: converts string octal into corresponding decimal number

-- return 0 for invalid octal numbers
--- strings that contain characters other than 0-7

-- init `octal` var and assign to integer representation of input string (convert string to integer to drop leading zeros and commence conversion operations)

-- convert `octal` to a decimal number
--- init `power` var, assign to `octal` length minus 1
--- init empty array called `decimal`
--- loop through each digit in octal number
---- multiply current octal digit by (8 raised to the power of `power`
---- append resulting value to `decimal`
---- decrement `power` by 1
--- end loop

-- return sum of all numbers in `decimal`
=end

class Octal
  def initialize(string_number)
    @string_octal = string_number
  end

  def to_decimal
    return 0 if invalid_octal?
    octal = @string_octal.to_i
    octal.digits.map.with_index { |n, idx| n * (8 ** idx) }.sum
  end 

  private

  def invalid_octal?
    @string_octal.match?(/[^0-7]/)
  end
end

# octal = Octal.new("130")
# p octal.to_decimal