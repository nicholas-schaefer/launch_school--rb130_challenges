require 'bundler/setup'

class Anagram
  attr_reader :original_word
  def initialize(original_word)
    @original_word = original_word
  end

  def match(possible_anagrams)
    original_word_downcased_chars_tally = original_word.downcase.chars.tally
    possible_anagrams.select do |possible_anagram|
      next false if possible_anagram.downcase == original_word.downcase
      original_word_downcased_chars_tally == possible_anagram.downcase.chars.tally
    end
  end
end
