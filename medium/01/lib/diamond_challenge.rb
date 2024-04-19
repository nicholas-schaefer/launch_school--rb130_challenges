require 'bundler/setup'

class Diamond
  def self.make_diamond(letter)
    self.new(letter).array_of_strings.join()
  end

  attr_accessor :half_number_of_lines_and_chars, :number_of_lines_and_chars, :array_of_strings
  attr_reader :second_letter
  def initialize(letter)
    self.second_letter = letter
    self.half_number_of_lines_and_chars = distance_from_letter_A(second_letter)
    self.number_of_lines_and_chars = half_number_of_lines_and_chars * 2 + 1
    self.array_of_strings = generate_array_of_strings(number_of_lines_and_chars)
  end

  private

  def generate_array_of_strings(line_char_count)
    first_half_array_of_strings = []
    half_line_char_count = line_char_count/2
    char_to_insert = "A"
    (0..half_line_char_count).each do |i|
      line_string = (" " * line_char_count)
      line_string[half_line_char_count - i] = char_to_insert
      line_string[half_line_char_count + i] = char_to_insert
      line_string << "\n"
      first_half_array_of_strings << line_string
      char_to_insert.next!
    end
    second_half_array_of_strings = first_half_array_of_strings.dup.reverse
    first_half_array_of_strings + second_half_array_of_strings[1..]
  end

  def second_letter=(letter)
    raise ArgumentError unless ("A".."Z").any?(letter)
    @second_letter = letter
  end

  def distance_from_letter_A(letter2)
    letter2.ord - "A".ord
  end
end
#
=begin
Input: string
Output: strings

Calculate number of lines, same as number of chars in line

a = first = 1
b = second = 3
c = third = 5
d = fourth = 7

How to get to next character
p "A".ord.next.chr

Calclulate number of chars in line/2.
 +- line number replace space


=end
