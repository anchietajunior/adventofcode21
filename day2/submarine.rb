# frozen_string_literal: true

# This is a submarine
class AimingSubmarine
  attr_accessor :depth, :position, :aim

  def initialize(&blk)
    @depth = 0
    @position = 0
    @aim = 0

    if block_given?
      instance_eval(&blk)
    end
  end

  def down(n)
    @aim += n
  end

  def up(n)
    @aim -= n
  end

  def forward(n)
    @position += n
    @depth += n * aim
  end

  def location
    @depth * @position
  end
end

# This is a submarine
class Submarine
  attr_accessor :depth
  attr_accessor :position

  def initialize(&blk)
    @depth = 0
    @position = 0

    if block_given?
      instance_eval(&blk)
    end
  end

  def down(n)
    @depth += n
  end

  def up(n)
    @depth -= n
  end

  def forward(n)
    @position += n
  end

  def location
    @depth * @position
  end
end

if __FILE__ == $0
  instructions = File.read(ARGV.first)
  submarine = AimingSubmarine.new do
    eval(instructions)
  end
  puts submarine.location
end
