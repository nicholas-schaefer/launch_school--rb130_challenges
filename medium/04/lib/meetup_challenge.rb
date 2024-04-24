# frozen_string_literal: true

require 'bundler/setup'
require 'date'

# The Meetup class finds perfect time on a calendar for a meetup
class Meetup
  attr_reader :provided_month, :date_first_of_month

  def initialize(year, month)
    @provided_month = month
    @date_first_of_month = Date.new(year, month)
    @converted_weekday = nil
    @converted_schedule = nil
    @are_looking_for_teenth = nil
    @are_looking_for_last = nil
  end

  def day(weekday, schedule)
    self.converted_weekday = convert_weekday(weekday)
    self.converted_schedule = convert_schedule(schedule)

    counter = 0
    date = date_first_of_month.dup
    dates_array = []
    while provided_month == date.month
      if date.httpdate.slice(0, 3) == converted_weekday
        if are_looking_for_teenth
          counter += 1
          dates_array << date
          break if teenth?(date.day)
        elsif are_looking_for_last
          dates_array << date
          counter += 1
        else
          counter += 1
          return date if counter == converted_schedule
        end
      end
      date = date.next
    end
    dates_array.empty? ? nil : dates_array.last
  end

  private

  attr_accessor :converted_weekday, :converted_schedule, :are_looking_for_teenth, :are_looking_for_last

  def convert_weekday(weekday)
    weekday_capitalized = weekday.capitalize
    raise ArgumentError unless Date::DAYNAMES.include?(weekday_capitalized)

    weekday_capitalized.slice(0, 3)
  end

  def convert_schedule(schedule)
    case schedule.downcase
    when 'first'  then 1
    when 'second' then 2
    when 'third'  then 3
    when 'fourth' then 4
    when 'fifth'  then 5
    when 'last'
      self.are_looking_for_last = true
    when 'teenth'
      self.are_looking_for_teenth = true
      1
    else
      raise ArgumentError
    end
  end

  def teenth?(day_number)
    (13..19).any?(day_number)
  end
end

def app
  meetup1 = Meetup.new(2015, 10)
  p meetup1.day('Wednesday', 'fifth')
end
# app()
