=begin
GOAL:

# METHOD: Diamond::make_diamond (class method)
# INPUT: String
# OUTPUT: Diamond figure in output
# RULES:
- input string will be a single, uppercase alphabetical char
- output will be a diamond figure in console that:
-- starts with 'A' at the top point of the diamond
-- input string will represent halfway point of diamond
-- after halfway point, bottom half of diamond will work its way back down towards letter 'A'

- if input is 'A', return 'A'

# TEST:
- input is "B"
 A 
B B
 A
 - input is "C"
   A  
  B B
 C   C
D     D
 C   C
  B B
   A
 
# ALGORITHM:

1. init these variables
-- `rows`, assign to empty array

-- `alpha_range`, assign to array containing all uppercase alpha characters from 'B' to input char

-- `outter`, assign to length of `alpha_range`

-- `inner`, assign to 1

2. build top row, append to `rows`
- init var called `top_and_bottom_row`, assign to a string containing: 
-- " " * outter + "A" + " " * outter
-- append above string to `rows`

3. build bottom half of diamond, append to `rows`

- loop through each char in `alpha_range`
-- decrement outter by 1
-- append " " x `outter` to `current_row`
-- append current char to `current_row`
-- append " " x `inner` to `current_row`
-- append current char to `current_row`
-- append " " x `outter` to `current_row`
-- append
-- increment `inner` by 2
- end loop

4. Build bottom half of diamond, append to `rows`
- init `bottom_rows`, assign to slice of `rows` form index 1 thorugh -2
- reverse `bottom_rows`
- append `bottom_rows` to `rows`

6. concatenate strings in `rows` with a newline char "\n", return resulting string

=end

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == "A"
    rows = build_top_half(letter)
    rows << build_bottom_half(rows)
    rows.flatten.join
  end

  class << self 
  
    private
    
    def build_top_half(letter)
      top_rows = []
      alpha_range = ("B"..letter).to_a
      outter = alpha_range.length
      inner = 1
      
      first_row = "#{" " * outter}A#{" " * outter}\n"
      top_rows << first_row

      alpha_range.each do |char|
        outter -= 1
        out_space = " " * outter
        in_space = " " * inner

        top_rows << out_space + char + in_space + char + out_space + "\n"
        
        inner += 2
      end

      top_rows
    end

    def build_bottom_half(rows)
      rows[0..-2].reverse
    end
  end
end

puts Diamond.make_diamond("M")


# expected
# "  A  \n B B \nC   C\n B B \n  A  \n"

# actual
# "  A  \n B B \nC   C\n B B \n  A  "