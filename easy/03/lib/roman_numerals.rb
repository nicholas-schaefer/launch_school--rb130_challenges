# frozen_string_literal: true

require 'bundler/setup'

# Class RomanNumerals converts digits to Roman Numerals
class RomanNumeral
  ROMAN_CHAR_CONVERSION = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XL',
    50 => 'L',
    60 => 'LX',
    70 => 'LXX',
    80 => 'LXXX',
    90 => 'XC',
    100 => 'C',
    200 => 'CC',
    300 => 'CC',
    400 => 'CD',
    500 => 'D',
    600 => 'DC',
    700 => 'DCC',
    800 => 'DCCC',
    900 => 'CM',
    1000 => 'M',
    2000 => 'MM',
    3000 => 'MMM'
  }.freeze

  def initialize(modern_int)
    self.modern_int = modern_int
    self.array_parts = nil
    self.array_roman_parts = nil
  end

  def to_roman
    calculate_array_parts
    caluclate_roman_equivalants_of_parts
    array_roman_parts.join
  end

  private

  attr_accessor :modern_int, :array_parts, :array_roman_parts

  def calculate_array_parts
    digit_length = modern_int.to_s.length
    array_digit_strings = modern_int.to_s.split('')
    array_ints = []
    (0...digit_length).reverse_each.with_index do |int, idx|
      array_ints << array_digit_strings[idx].to_i * (10**int)
    end
    self.array_parts = array_ints
  end

  def caluclate_roman_equivalants_of_parts
    self.array_roman_parts = array_parts.map { |part| ROMAN_CHAR_CONVERSION[part] }
  end
end
