require 'bundler/setup'

class BeerSong

  def self.verse(num)
    array = []
    array << self.get_verse(num)
    array.join("\n")
  end

  def self.verses(*nums)
    min_max = nums.minmax
    low_num, high_num = min_max

    if min_max == nums
      (low_num..high_num).each.with_object([]) do |num, array|
        array << self.get_verse(num)
      end.join("\n")
    else
      (low_num..high_num).reverse_each.with_object([]) do |num, array|
        array << self.get_verse(num)
      end.join("\n")
    end
  end

  def self.lyrics
    (0..99).to_a.reverse.each.with_object([]) do |num, array|
      array << self.get_verse(num)
    end.join("\n")
  end

  private_class_method def self.get_verse(verse_num)
    raise ArgumentError unless (0..99).any?(verse_num)
    case verse_num
    when 3..99
    <<~VERSE
    #{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.
    Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.
    VERSE
    when 2
    <<~VERSE
    #{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.
    Take one down and pass it around, #{verse_num - 1} bottle of beer on the wall.
    VERSE
    when 1
    <<~VERSE
    #{verse_num} bottle of beer on the wall, #{verse_num} bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
    when 0
    <<~VERSE
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
    end
  end
end
