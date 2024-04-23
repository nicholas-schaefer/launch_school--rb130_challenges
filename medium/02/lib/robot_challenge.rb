require 'bundler/setup'

class Robot

  @@names = []

  UPPERCASE_LETTERS = ("A".."Z").to_a
  DIGIT_STRINGS = ("0".."9").to_a

  attr_reader :name
  def initialize
    reset()
  end

  def reset
    self.name =
      loop do
        potential_name = random_untaken_name()
        break potential_name unless @@names.include?(potential_name)
      end
      @@names << self.name
    nil
  end

  private
  attr_writer :name
  def random_untaken_name
    UPPERCASE_LETTERS.sample +
    UPPERCASE_LETTERS.sample +
    DIGIT_STRINGS.sample +
    DIGIT_STRINGS.sample +
    DIGIT_STRINGS.sample
  end
end
