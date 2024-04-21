require "bundler/setup"
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/scrabble_score_challenge.rb'

Minitest::Reporters.use!

=begin
You'll need the following tile scores:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

How to Score
=end

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    #skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    #skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    #skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    #skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    #skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    #skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    #skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    #skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end
