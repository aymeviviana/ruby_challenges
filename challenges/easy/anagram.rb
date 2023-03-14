=begin
Goal: write a program that takes a word and a possible list of anagrams and selects the correct sublist that contains the anagrams of the word

For example, given the word "listen", a qualifying anagram would be "inlets" whereas a word like "google" would not qualify. 

Requirements:
- Anagrams are words whose characters can be rearranged to form a different word
-- all characters of the word must be used, not just a sub-set
-- if more characters are required to form a new word than are available in the original word, it is NOT an anagram
- identical words cannot be anagrams (i.e. corn != corn)
- anagrams are NOT case sensitive (i.e. "Carthorse" is a valid anagram of "Orchestra")
-- downcase your word and the words in the list pasesd to #match

Algorithm:
1. Define an `Anagram` class

2. Define a constructor with a single parameter which will reference the string passed in as an argument.
- Save the string to instance variable called @word

3. Define a #match instance method that takes an array argument and returns a new array containing only the anagrams from the array argument. 

- define an empty array called `anagrams`

- loop through each index in array argument
-- sort @word chars in alphabetical order and downcase
-- if sorted_word is equal to sorted/downcased version of current word
--- append current word to `anagrams`
-- else
--- move onto the next word
- end loop

return `anagrams`
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    sorted_word = @word.downcase.chars.sort.join

    list.select do |current_word|
      @word.downcase != current_word.downcase &&
      sorted_word == current_word.downcase.chars.sort.join
    end
  end
end

# anagram = Anagram.new("banana")
# p anagram


