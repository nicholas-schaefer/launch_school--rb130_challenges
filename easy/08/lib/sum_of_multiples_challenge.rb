class SumOfMultiples

  def self.to(top_int)
    self.new().to(top_int)
  end

  attr_reader :multiples, :top_int
  def initialize *args
    self.multiples = args
    self.set_multiples_under_top_int = Set.new
  end

  def to(int)
    self.top_int = int
    multiples.each do |multiple|
      1.upto((top_int-1)/multiple).each do |i|
        set_multiples_under_top_int << multiple * i
      end
    end
    set_multiples_under_top_int.sum
  end

  private
  attr_accessor :set_multiples_under_top_int
  def multiples=(multiples)
    raise ArgumentError unless multiples.all?{|arg| arg > 0}
    @multiples = multiples.length.zero? ? [3,5] : multiples
  end

  def top_int=(int)
    raise ArgumentError unless int > 0
    @top_int = int
  end

end

# p SumOfMultiples.to(10)
# p thing1 = SumOfMultiples.new(3,5)
# p thing1.multiples
# p thing1.to(10)
# p thing1
# p thing1.send(:set_multiples_under_top_int).sum
