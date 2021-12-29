# frozen_string_literal: true

# This is an OceanFloor Class
class OceanFloor
  def self.parse(raw_lines)
    lines = raw_lines.map do |line|
      line.split('->').map do |pair|
        pair.split(',').map(&:to_i)
      end
    end
    OceanFloor.new(lines)
  end

  attr_reader :lines, :grid

  def initialize(lines)
    @lines = lines
    max = lines.flatten.max + 1
    @grid = Array.new(max) { Array.new(max, 0) }
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, value)
    @grid[x][y] = value
  end

  def draw_horizontal_line((x1, y1), (x2, y2))
    x_dir = x1 < x2 ? 1 : -1
    y_dir = y1 < y2 ? 1 : -1

    self[x1, y1] += 1
    while x1 != x2 && y1 != y2
      x1 += x_dir
      y1 += y_dir
      self[x1, y1] += 1
    end
  end

  def draw_normal_line((x1, y1), (x2, y2))
    [x1, x2].min.upto([x1, x2].max).each do |x|
      [y1, y2].min.upto([y1, y2].max).each do |y|
        self[x, y] += 1
      end
    end
  end

  def draw_lines
    lines.each do |((x1, y1), (x2, y2))|
      if x1 == x2 || y1 == y2
        # iterate
        draw_normal_line([x1, y1], [x2, y2])
      else
        draw_horizontal_line([x1, y1], [x2, y2])
      end
    end
  end

  def to_s
    @grid.transpose.map do |row|
      row.map do |cell|
        cell.zero? ? '.' : cell
      end.join
    end
  end

  def overlaps
    @grid.flatten.count { _1 > 1 }
  end
end

if __FILE__ == $0
  floor = OceanFloor.parse(File.readlines(ARGV.first))
  floor.draw_lines
  puts floor.to_s
  puts floor.overlaps
end
