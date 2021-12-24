# frozen_string_literal: true

require 'byebug'

# Monkey Patch Array class
class Array
  def median
    half = length / 2
    self[half]
  end
end

# Class to run Submarine Diagnostics
class Diagnostic
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def gammar_rate
    half = data.length / 2
    frequency.map { _1 <= half ? 0 : 1 }.join.to_i(2)
  end

  def epsilon_rate
    gammar_rate ^ ['1' * width].join.to_i(2)
  end

  def oxygen_rate
    included = data.sort

    width.times do |t|
      median = included.median
      i = width - t
      included = included.reject { _1[i] != median[i] }
    end

    return included.find { _1[0] == 1 } if included.length == 2

    included.first
  end

  def co2_rate
    included = data.sort

    width.times do |t|
      median = included.median
      i = (width - 1) - t
      included = included.select { _1[i] != median[i] }

      next unless included.length == 2

      return included.find(&:zero?) || included.first
    end
  end

  def frequency
    counter = Array.new(width, 0)
    data.each do |d|
      width.times do |i|
        counter[i] += d[i]
      end
    end
    counter.reverse
  end

  def width
    data.max.to_s(2).length
  end
end

if __FILE__ == $0
  data = File.readlines(ARGV.first).map { _1.to_i(2) }
  diagnostic = Diagnostic.new(data)
  puts diagnostic.oxygen_rate * diagnostic.co2_rate
end
