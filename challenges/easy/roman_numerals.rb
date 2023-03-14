=begin
Goal: write a program that converts modern decimal numbers into their roman number equivalents

Rules:
1. reference notebook for conversion hashes
2. program must convert numbers upt o 3000 

Test Requirements:
1. Define a `RomanNumeral` class
2. define a constructor that takes an integer as an argument
- save integer to instance variable called @decimal
3. Define an instance method #to_roman that converts @decimal to roman numeral and returns roman numeral as a string. 
- define 4 conversion hashes (ones, tens, hundreds and thousands)

- define an array called `conversion_array`, it should references 
all 4 hashes in this order: ones, tens, hundreds and thousands

- init var 'digits_array' to an array of all integer digits in @decimal, use #digits and leave digits in reverse order

- define a var called `roman_numeral`, assign to empty string

- loop through each index in 'digits_array'
-- use current index to access hash in `conversion_array`
-- use value a current index to access string value from current hash
-- PREPEND string value to `roman_numeral`
- close loop

return `roman_numeral`
=end

class RomanNumeral
  CONVERSION = {
    1 => ["I", "X", "C", "M"],
    2 => ["II", "XX", "CC", "MM"],
    3 => ["III", "XXX", "CCC", "MMM"],
    4 => ["IV", "XL", "CD"],
    5 => ["V", "L", "D"],
    6 => ["VI", "LX", "DC"],
    7 => ["VII", "LXX", "DCC"],
    8 => ["VIII", "LXXX", "DCCC"],
    9 => ["IX", "XC", "CM"],
    0 => ""
  }

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    digits = @decimal.digits

    roman_numerals_array = digits.map.with_index do |digit, idx|
      CONVERSION[digit][idx]
    end

    roman_numerals_array.reverse.join
  end
end

# rom_num = RomanNumeral.new(324)
# p rom_num.to_roman

