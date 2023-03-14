=begin
GOAL: Write a program that produces randomly generated robot names that follow a predictable sequence. Program should not allow the use of the same name twice. 

REQUIREMENTS:
1. define a `Robot` class with the following methods:

- method: #name
- input: none
- output: string
- rules: 
--output string should be a randomly generated robot name that:
--- starts with 2 uppercase alpha char
--- ends with 3 random digits
--- does not collide with any other previously generated robot names (consider using a class variable called @@used_names that references an array containing all previously created robot names)
--- sticks (i.e. is assigned to instance variable upon creation)
- algorithm: 

1. Initialize these variables:
- class variable called `@@used_names`, assign to empty array

2. Generate a list of all possible 2-ALPHA-CHAR combinations, assign to var called `alpha_combos`
- use #product
- do it manually

3. Generate a list of all possible 3-digit numbers, assign to var called `three_digit_numbers`
- use #product
- do it manually

4. create robot name
- if @name is currently assigned to nil
-- select random element from `alpha_combos`
-- select random element from `three_digit_numbers`
-- concatenate both elements (continue logic below)
- else
-- return @name

- if resulting string included in @@used_names
-- generate a new name
- otherwise
-- add newly crated name to @@used_names
-- assign newly created name to @name instance variable
-- return @name instance variable


- method: #reset 
- input: none
- output: none
- rules:
-- when called, #reset should reassign @name instance variable to nil 
=end

class Robot
  @@used_names = []
  ALPHA_COMBOS = ("A".."Z").to_a.product(("A".."Z").to_a)
  DIGITS = (0..9).to_a
  THREE_DIGIT_COMBOS = DIGITS.product(DIGITS, DIGITS)

  def initialize
    @name = nil
  end

  def name
    @name = create_new_name if @name == nil
    @name
  end

  def reset 
    @@used_names.delete(@name)
    @name = nil
  end

  private

  def create_new_name
    robot_name = ""
    loop do 
      robot_name = ALPHA_COMBOS.sample.join + THREE_DIGIT_COMBOS.sample.join
      break unless @@used_names.include?(robot_name)
    end
    @@used_names << robot_name
    robot_name
  end
end

robot = Robot.new
p robot.name
p robot.name