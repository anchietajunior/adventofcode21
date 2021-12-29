# frozen_string_literal: true

require_relative '../day5/ocean_floor'

RSpec.describe OceanFloor do
  it 'parses a string to an array of values' do
    floor = described_class.parse(
      [
        '0,9 -> 5,9',
        '8,0 -> 0,8'
      ]
    )

    expect(floor.lines).to eq(
      [
        [[0, 9], [5, 9]],
        [[8, 0], [0, 8]]
      ]
    )

    expect(floor.grid).to eq(
      Array.new(10) { Array.new(10, 0) }
    )
  end

  describe '#draw_lines' do
    it 'increments the grid across a vertical line' do
      floor = described_class.new([
        [[0, 0], [2, 2]]
      ])
      floor.draw_lines
      expect(floor.grid).to eq([
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1]
      ])
    end

    it 'increments the grid across a vertical line down' do
      floor = described_class.new([
        [[0, 2], [2, 0]]
      ])
      floor.draw_lines
      expect(floor.grid).to eq([
        [0, 0, 1],
        [0, 1, 0],
        [1, 0, 0]
      ])
    end

    it 'increments the grid across a horizontal line' do
      floor = described_class.new([
        [[0, 0], [2, 0]]
      ])
      floor.draw_lines
      expect(floor.grid).to eq([
        [1, 0, 0],
        [1, 0, 0],
        [1, 0, 0],
      ])
    end
  end
end
