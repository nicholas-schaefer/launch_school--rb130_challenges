require 'bundler/setup'

class Series
  attr_reader :string_of_digits
  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(num_of_slices)
    raise ArgumentError unless (1..string_of_digits.length).any?(num_of_slices)
    array_of_digits = string_of_digits.chars.map(&:to_i)
    array_of_digits.each_cons(num_of_slices).to_a
  end
end
