=begin
goal: write a program that calculates the Hamming Distance between two DNA strands

rules/requirements:
1. The Hamming Distance is the number of differences between two DNA strands. For example, there are 7 differences between the two DNA strands noted below

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

2. Define a DNA class from which to instantiate DNA strand objects

3. Define a constructor that takes a string argument that represents the first DNA strand in the comparison

4. Define a #hamming_distance instance method that takes a string argument which will represent the second DNA strand
- This method should return an integer that represents the hamming distance between the original DNA strand passed in during instantiation and the second DNA strand passed into the current instance method. 
- To calculate Hamming distance, compare the letter values, at each index in each string, for equality. 
- if we pass two empty strings to the program the hamming distance should be equal to 0. 
- include a check for dna strand lengths. If strands are not of equal length, determine length of shortest DNA strand and compute hamming distance based on length of shorter strand. It's important NOT TO ACTUALLY SHORTEN/MUTATE any strands. 

algorithm:

1. Define a DNA class from which to instantiate DNA strand objects
- instantiate a DNA object and confirm it works correctly

2. Define a constructor that takes a string argument that represents the first DNA strand in the comparison
- save the string value to an instance variable called `@first_strand`

3. Define a #hamming_distance instance method that takes a string argument which will represent the second DNA strand
- save the string value to a local variable called `second_strand`
- This method should return an integer that represents the hamming distance between @first_strand and 'second_strand'
-- define a local variable 'distance', assign to 0
-- determine length of shortest DNA strand
-- define a local variable 'comparison_length', assign to length of shortest strand
-- loop through each index in @first_strand from 0 up to `max_length - 1`
--- if characters at current index for both strands are NOT equal
---- increment `distance` by 1
--- otherwise, skip to the next character
-- return 'distance'
-- if we pass two empty strings to the program the hamming distance should be equal to 0. 
=end

class DNA
  def initialize(dna_strand)
    @first_strand = dna_strand
  end

  def hamming_distance(other_strand)
    distance = 0
    comparison_length = length_of_shorter_strand(other_strand)

    0.upto(comparison_length - 1) do |idx|
      distance += 1 if @first_strand[idx] != other_strand[idx]
    end
    
    distance
  end

  def length_of_shorter_strand(other_strand)
    [@first_strand, other_strand].min_by(&:length).length
  end
end

# dna_strand = DNA.new("ABCDE")
# p dna_strand
# dna_strand.hamming_distance("FGH")