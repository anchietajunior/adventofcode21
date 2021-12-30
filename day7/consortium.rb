# frozen_string_literal: true

require 'byebug'

# This is bunch of Crabs
class Consortium
  attr_reader :positions

  def initialize(positions)
    @positions = positions
  end

  def min_pos
    positions.min
  end

  def max_pos
    positions.max
  end

  def fuel(num)
    positions.inject(0) do |fuel, pos|
      x = (pos - num).abs
      fuel + ((x * (x + 1)) / 2.0).ceil
    end
  end

  def min_fuel
    min_fuel = Float::INFINITY
    min_pos.upto(max_pos).each do |n|
      f = fuel(n)
      min_fuel = f if f < min_fuel
    end
    min_fuel
  end
end

if __FILE__ == $0
  positions = File.read(ARGV.first).chomp.split(',').map(&:to_i)
  c = Consortium.new(positions)
  puts c.min_fuel
end
