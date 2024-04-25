# frozen_string_literal: true

require 'bundler/setup'

# The CustomSet class is a originally rolled rip off of Ruby's core `Set` class
class CustomSet
  attr_reader :custom_set

  def initialize(args_collection = [])
    @custom_set = []
    add(*args_collection)
  end

  def empty?
    custom_set.empty?
  end

  def contains?(int)
    custom_set.any?(int)
  end

  def subset?(other_custom_set_instance)
    custom_set.all? do |custom_set_el|
      other_custom_set_instance.contains?(custom_set_el)
    end
  end

  def disjoint?(other_custom_set_instance)
    custom_set.none? do |custom_set_el|
      other_custom_set_instance.contains?(custom_set_el)
    end
  end

  def eql?(other_custom_set_instance)
    custom_set.sort == other_custom_set_instance.custom_set.sort
  end

  alias == eql?

  def add(*args_collection)
    args_collection.each do |arg|
      custom_set << arg
    end
    self.custom_set = custom_set.uniq
    self
  end

  def intersection(other_custom_set_instance)
    self.custom_set =
      custom_set.select do |custom_set_el|
        other_custom_set_instance.contains?(custom_set_el)
      end
    self
  end

  def difference(other_custom_set_instance)
    self.custom_set =
      custom_set.reject do |custom_set_el|
        other_custom_set_instance.contains?(custom_set_el)
      end
    self
  end

  def union(other_custom_set_instance)
    add(*other_custom_set_instance.custom_set)
    custom_set.sort!
    self
  end

  private

  attr_writer :custom_set
end
