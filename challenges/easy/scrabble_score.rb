=begin
Goal: write a program that calculates the scrabble score for a word

Requirements:
1. Define a class called `Scrabble

2. Define a constructor that takes a string argument
- store string value in instance var called @word

3. Define an instance method #score that computes the scrabble score of @word

4. Letter values are outlined below

A, E, I, O, U, L, N, R, S, T	= 1
D, G = 2
B, C, M, P = 3
F, H, V, W, Y = 4
K = 5
J, X = 8
Q, Z = 10

5. upper and lowercase char equivalents are worht the same amount of points (i.e. "a" and "A" are both word 1 point)

Algorithm:
1. Define a class called `Scrabble

2. Define a constructor that takes a string argument
- store string value in instance var called @word

3. Define a constant called `LETTER_VALUES` that points to a hash:
- keys should be strings containing all uppercase letters that belong to a particular "letter group"
- values should be the number of points awarded to the corresponding "letter group"

4. Define an instance method #score that computes the scrabble score of @word
- init a local variable `score` to 0
- init a local var `word` to uppercase version of @word
- loop through each character in `word``
-- loop through each key-value pair in `LETTER_VALUES`
---If current `key`` includes current `word` character
---- increment `score` by current `value``
---else
---- move onto the next key-value pair
---end
--end inner loop
- end outer loop

return `score`
=end

class Scrabble
  LETTER_VALUES = {
    "A, E, I, O, U, L, N, R, S, T" =>	1,
    "D, G" =>	2,
    "B, C, M, P" =>	3,
    "F, H, V, W, Y" => 4,
    "K" => 5,
    "J, X" => 8,
    "Q, Z" =>	10
  }
  
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    @score = 0
    return @score if @word.nil?
    
    word = @word.upcase.gsub(/\s/, '')

    word.chars.each do |char|
      LETTER_VALUES.each do |letter_group, points|
        @score += points if letter_group.include?(char)
      end
    end
    
    @score
  end
end

# scrabble = Scrabble.new("ayme")
# scrabble.score
# p scrabble
