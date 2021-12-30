# frozen_string_literal: true

require 'byebug'

# This is a lanternfish school class
class School
  attr_accessor :ages

  def initialize(ages)
    @ages = {}
    9.times do |i|
      @ages[i] = ages.count(i)
    end
  end

  def pass_days(n)
    n.times { tick }
  end

  def num_fish
    @ages.values.inject(:+)
  end

  def tick
    # births receives the value at key 0
    births = @ages[0]
    # 8 times we increase the values inside the values
    8.times { |i| @ages[i] = @ages[i + 1] }
    # ages at 6 key receives 6 value + births count
    @ages[6] += births
    # ages at 8 key receives births count
    @ages[8] = births
  end
end

if __FILE__ == $0
  ages = File.read(ARGV.first).chomp.split(',').map(&:to_i)
  school = School.new(ages)
  school.pass_days(256)
  puts school.num_fish
end
