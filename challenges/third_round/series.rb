=begin
GOAL: write a program that takes a string of digits and returns all the possible consecutive number series of a specified length in that string

RULES:
- Throw an error if the specified length is greater than the string length

TEST:
program("01234", 3)  => ["012", "123", "234"]

class: `Series`

method: #initialize
input: string
output: Series object
algorithm:
1. save input string to @string instance variable

method: #slices
input: integer
output: array
rules:
- input integer represents length of the substrings to be extracted from @string
- ouput array should contain subarrays representing all possible consecutive number series of length equal to input integer
test:
"345678", 3 => [[3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8]]

algorithm:
1. Throw ArgumentError if specified length is greater than @string length
2. init an empty array called `sub_series`
3. identify all qualifying number series, append to `sub_series`
- loop through each index in @string: 0 to (@string length - specified length)
-- grab string slice that begins at current index and has length of specified length
-- split substring into array of characters, convert each character to an integer, append resulting array to `sub_series`
- end the loop

4. return `sub_series`
=end

class Series 
  def initialize(string)
    @string = string
  end

  def slices(sub_length)
    raise ArgumentError.new if sub_length > @string.length
    sub_series = []

    0.upto(@string.length - sub_length) do |idx|
      sub_series << @string.slice(idx, sub_length).chars.map(&:to_i)
    end

    sub_series
  end
end

# series = Series.new("12345")
# p series.slices(3)