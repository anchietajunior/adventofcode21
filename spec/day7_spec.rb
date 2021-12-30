# frozen_string_literal: true

require_relative '../day7/consortium'

RSpec.describe Consortium do
  it 'has a min_fuel of 71' do
    positions = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    c = described_class.new(positions)
    expect(c.min_pos).to eq 0
    expect(c.max_pos).to eq 16
  end

  it 'sets a number for a specific position' do
    positions = [1, 2, 3]
    c = described_class.new(positions)
    expect(c.fuel(2)).to eq 2

    positions = [1, 5, 9] # 3, 2, 21
    c = described_class.new(positions)
    expect(c.fuel(3)).to eq 21 + 3 + 3
  end

  it 'has the correct min_fuel' do
    positions = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    c = described_class.new(positions)
    expect(c.min_fuel).to eq 168
  end
end
