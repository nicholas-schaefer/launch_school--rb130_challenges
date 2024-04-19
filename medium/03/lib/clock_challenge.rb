require 'bundler/setup'

class Clock
  def self.at(hour, minute = 0)
    convert_to_hours_and_minutes(hour: hour, minute: minute)
  end

  private_class_method def self.convert_to_hours_and_minutes(hour:, minute:)
  # p [hour, minute]
  everything_minutes = hour * 60 + minute

  clock_instance = self.new
  clock_instance.total_minutes = everything_minutes
  clock_instance
end

  attr_accessor :total_minutes

  def to_s
    create_time_string
  end

  def ==(other)
    total_minutes == other.total_minutes
  end

  def +(minutes)
    self.total_minutes += minutes
    create_time_string
  end

  def -(minutes)
    self.total_minutes -= minutes
    create_time_string
  end

  private
  def create_time_string
    create_clock_string = Proc.new do |total_minutes|
      raw_hours_minutes = total_minutes.divmod(60)
      unformatted_hours, unformatted_minutes = raw_hours_minutes
      unformatted_hours = unformatted_hours >= 24 ? unformatted_hours - 24 : unformatted_hours
      formatted_hours = "%02d" % unformatted_hours
      formatted_minutes = "%02d" % unformatted_minutes
      clock_array = [formatted_hours, formatted_minutes]
      clock_array.join(':')
    end
    create_clock_string.call(total_minutes)
  end
end
# clock = Clock.at(11, 5)
# y = clock - 10
# p y
# puts Clock.at(15, 30)
# p Clock.at(15, 30) == Clock.at(14, 90)
# a = Clock.at(10, 6)
# b = Clock.at(10, 6)

# p a == b

