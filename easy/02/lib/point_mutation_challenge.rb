require 'bundler/setup'

class DNA
  def initialize(original_sequence)
    self.original_sequence = original_sequence
  end

  def hamming_distance(second_sequence)
    self.second_sequence = second_sequence
    self.smallest_char_count = count_chars_to_compare
    (0...smallest_char_count).reject {|x| original_sequence[x] == second_sequence[x] }.count
  end

  private
  attr_accessor :original_sequence, :second_sequence, :smallest_char_count

  def count_chars_to_compare
    original_length = original_sequence.length
    second_length = second_sequence.length
    (original_length < second_length) ? original_length : second_length
  end

end
