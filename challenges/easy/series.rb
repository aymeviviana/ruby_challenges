=begin
GOAL:
write a program that will take a string of digits and return all possible consecutive number series of a specified length. For example:
- string "01234" has the following 3-digit sequences => [012, 123, 234]
- string "01234" has the following 4-digit sequences => [0123, 1234]

REQUIREMENTS:

# Define a class: `Series`

# method: `#initialize` instance method
# input: 1 string argument
# output: `Series` object
# algorithm: save string value to @string_number

# method: `#slices` instance method
# input: 1 integer argument
# output: 2 dimensional array 
# rules: 
- return array should contain all consecutive number series that can be derived from @string_number, equal to length of input integer

- each consecutive number series should be 
-- contained in its own sub-array
-- be represented by individual integer digits, not strings

- raise ArgumentError if integer passed into #slices is greater than length of @string_number

# algorithm:
1. init var called `digits`, assign to an array containing an integer representation of each string digit in @string_number
- convert @string_number to array of individual characters
- loop through array of string digits, convert each one to an integer and append to an array called `digits`

2. identify each consecutive number series in `digits` of length equal to #slices input integer, store in array and append array to `all_slices`
- use #each_cons to append each sub-series to `all_slices`

- use loop

3. Return `all_slices`
=end

class Series
  def initialize(string)
    @string_number = string
  end

  def slices(series_length)
    raise ArgumentError.new if series_length > @string_number.length

    digits = convert_string
    all_slices = []
    digits.each_cons(series_length) { |pair| all_slices << pair }
    all_slices
  end

  private 

  def convert_string
    @string_number.chars.map(&:to_i)
  end
end

# series = Series.new("12345")
# p series.slices(2)

