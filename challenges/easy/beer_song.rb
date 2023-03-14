=begin
GOAL:
Write a program that can generate the lyrics of the "99 Bottles of Beer" song. 

REQUIREMENTS:
1. Define a class called `BeerSong` with the following methods:
- ::verse (class method that takes a single integer argument)
-- if `bottles` > 1 return this string
"#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
"Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"

-- if `bottles` is equal to exactly 1, return this string
"1 bottle of beer on the wall, 1 bottle of beer.\n" \
"Take it down and pass it around, no more bottles of beer on the wall.\n"

-- if `bottles` is equal to 0, return this string
"No more bottles of beer on the wall, no more bottles of beer.\n" \
"Go to the store and buy some more, 99 bottles of beer on the wall.\n"

- ::verses (class method that takes two integer arguments)
-- loop down from first int arg to second integer argument, assign each number to `bottles`
--- call ::verse(bottles)

- ::lyrics (class method that takes NO arguments, returns entire beer song lyrics)
-- loop down from 99 to 0, assign each number to `bottles`
--- call ::verse(bottles)
=end

class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def sing_verse
    case bottles
    when 0 then zero_bottles
    when 1 then one_bottle
    when 2 then two_bottles
    else default_bottles
    end
  end

  private

  def zero_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def default_bottles
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\nTake one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong 
  def self.verse(bottles)
    Verse.new(bottles).sing_verse
  end

  def self.verses(start_val, end_val)
    verses = []
    start_val.downto(end_val) do |bottles|
      verses << Verse.new(bottles).sing_verse
    end
    verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

# p BeerSong.verses(99, 98)