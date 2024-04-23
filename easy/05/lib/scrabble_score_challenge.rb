require "bundler/setup"

class Scrabble

  def self.score(word_str)
    self.new(word_str).score
  end

  CONSTANT = {
    "a" => 1, "b" => 3, "c" => 3, "d" => 2,
    "e" => 1, "f" => 4, "g" => 2, "h" => 4,
    "i" => 1, "j" => 8, "k" => 5, "l" => 1,
    "m" => 3, "n" => 1, "o" => 1, "p" => 3,
    "q" => 10, "r" => 1, "s" => 1, "t" => 1,
    "u" => 1, "v" => 4, "w" => 4, "x" => 8,
    "y" => 4, "z" => 10,
  }

  attr_reader :word_str
  def initialize(word_str)
    @word_str = word_str
  end

  def score
    return 0 if word_str.nil? || word_str.strip.empty?
    word_str.downcase.each_char.reduce(0) do |sum, char|
      sum + CONSTANT[char]
    end
  end
end

