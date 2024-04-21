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
    create_time_string == other.create_time_string
    # total_minutes == other.total_minutes
  end

  def +(minutes)
    minutes = under1440(minutes)
    self.total_minutes += minutes
    create_time_string
  end

  def -(minutes)
    minutes = under1440(minutes)
    self.total_minutes -= minutes
    if self.total_minutes.negative?
      self.total_minutes = 1440 + self.total_minutes
    end
    create_time_string
  end

  # private
  def create_time_string
    create_clock_string = Proc.new do |total_minutes|
      raw_hours_minutes = total_minutes.divmod(60)
      unformatted_hours, unformatted_minutes = raw_hours_minutes
      unformatted_hours = under24(unformatted_hours)
      unformatted_minutes = under1440(unformatted_minutes)
      formatted_hours = "%02d" % unformatted_hours
      formatted_minutes = "%02d" % unformatted_minutes
      clock_array = [formatted_hours, formatted_minutes]
      clock_array.join(':')
    end
    create_clock_string.call(total_minutes)
  end

  def under24(hours)
    until hours < 24 do
      hours -= 24
    end
    hours
  end

  def under1440(minutes)
    until minutes < 1440 do
      minutes -= 1440
    end
    minutes
  end
end

clock1 = Clock.at(0, 30) - 60
clock2 = Clock.at(23, 30)
p clock1
p clock2
p clock2.create_time_string
# p "helo"
# puts clock1 = Clock.at(0, 30) - 60
# clock2 = Clock.at(23, 30)
# p"---"
# # p clock1
# # # p clock1.total_minutes
# # p clock2.total_minutes

# # p clock1
# p clock2
