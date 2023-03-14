=begin
Goal: Write an oop program that determines whether a triangle is equilateral, isosceles or scalene. 

input: 3 integers that represent three triangle sides
output: string (i.e. 'equilateral', 'isosceles', 'scalene') or ArgumentError

rules/requirements:
1. equilateral = all three sides equal in length

2. isosceles = exactly two sides are equal in length

3. scalene = all three sides are different lengths

4. for a shape to be a triangle, all sides must have length > 0 AND the sum of the lengths of ANY two sides must be greater than the length of the third side. 

5. Define a Triangle class with an #initialize method that takes three arguments. Constructor method should raise an ArgumentError if:
-- any side is equal to 0
-- any side is negative number
-- sum of ANY two sides is less than length of third side

6. Define a #kind instance method that returns a string that describes the type of triangle we're dealing with. 
-- (equilateral, isosceles or scalene)

7. solution should accommodate smaller triangles (i.e. triangle sides of lengths less than 1)

ALGORITHM:##################################

1. Define a Triangle class

2. Define a constructor that takes three integer arguments that represent triangle side lengths. Constructor should raise an ArgumentError if 
-- any side is equal to 0
-- any side is negative number
-- sum of ANY two sides is less than length of third side
--- first + second must be greater than third
--- first + last must be greater than second
--- second + last must be greater than first

3. Define a #kind instance method that returns a string describing the type of triangle in question
- equilateral = all three sides equal in length
- isosceles = exactly two sides are equal in length
- scalene = all three sides are different lengths
=end

class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    validate_lengths
  end
  
  def validate_lengths
    raise ArgumentError.new("Invalid Triangle Lengths!") if zero_or_negative_length? || illegal_length?
  end

  def zero_or_negative_length?
    @sides.any? { |side| side <= 0 }
  end

  def illegal_length?
    @sides[0] + @sides[1] <= @sides[2] ||
    @sides[0] + @sides[2] <= @sides[1] ||
    @sides[1] + @sides[2] <= @sides[0]
  end

  def kind
    if all_sides_equal_length?
      'equilateral'
    elsif two_sides_equal_length?
      'isosceles'
    else
      'scalene'
    end
  end

  def all_sides_equal_length?
    @sides.uniq.length == 1
  end

  def two_sides_equal_length?
    @sides.uniq.length == 2
  end
end


# triangle = Triangle.new(3, 5, 4)
# p triangle