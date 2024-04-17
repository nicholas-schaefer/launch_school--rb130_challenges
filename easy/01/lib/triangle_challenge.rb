require 'bundler/setup'

class Triangle
  def initialize(side1, side2, side3)
    self.side_args = [side1, side2, side3]
    self.sides_sorted_from_smallest = nil
    validate()
  end

  def kind
    case sides_sorted_from_smallest.uniq.count
    when 3 then "scalene"
    when 2 then "isosceles"
    when 1 then "equilateral"
    else raise ArgumentError
    end
  end

  private
  attr_accessor :side_args, :sides_sorted_from_smallest

  def validate
    validate_all_positive_numbers?()
    self.sides_sorted_from_smallest = side_args.sort
    validate_size_inequality_is_legal?()
  end

  def validate_all_positive_numbers?
    side_args.each do |side_arg|
      raise ArgumentError, "Not a number" unless side_arg.is_a? Numeric
      raise ArgumentError, "Not a positive number" unless side_arg > 0
    end
    true
  end

  def validate_size_inequality_is_legal?
    raise ArgumentError, "Smallest 2 sides must be greater than largest side" if sides_sorted_from_smallest.first(2).sum <= sides_sorted_from_smallest.last
    true
  end

end

# triangle1 = Triangle.new(5, 4, 5)
# p triangle1.send(:side_args)
# p triangle1.send(:sides_sorted_from_smallest)
# p triangle1.kind
# p send(Triangle.new(3, 4, 5).sides)
