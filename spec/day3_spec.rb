# frozen_string_literal: true

require_relative '../day3/diagnostic'

RSpec.describe Array do
  describe '#media' do
    it 'returns the middle element it has 3 elements' do
      a = [1, 2, 3]
      expect(a.median).to eq 2
    end

    it 'returns the middle element it has 4 elements' do
      a = [1, 2, 3, 4]
      expect(a.median).to eq 3
    end

    it 'returns the middle element it has 2 elements' do
      a = [1, 2]
      expect(a.median).to eq 2
    end

    it 'returns the middle element it has 1 element' do
      a = [1]
      expect(a.median).to eq 1
    end
  end
end

RSpec.describe 'Binary Diagnostics' do
  describe 'gammar rate' do
    it 'has a diagnostic' do
      diagnostic = Diagnostic.new(
        [
          0b00100,
          0b11110,
          0b10110
        ]
      )
      expect(diagnostic.gammar_rate).to eq(0b10110)
    end
  end

  describe 'epsilon rate' do
    it 'has a diagnostic' do
      diagnostic = Diagnostic.new(
        [
          0b00100,
          0b11110,
          0b10110
        ]
      )
      expect(diagnostic.epsilon_rate).to eq(0b01001)
    end
  end

  describe 'oxygen rate' do
    it 'has a diagnostic' do
      diagnostic = Diagnostic.new(
        [
          0b00100,
          0b11110,
          0b10110,
          0b10111,
          0b10101,
          0b01111,
          0b00111,
          0b11100,
          0b10000,
          0b11001,
          0b00010,
          0b01010
        ]
      )
      expect(diagnostic.oxygen_rate).to eq(23)
    end
  end

  describe 'co2 rate' do
    it 'has a diagnostic' do
      diagnostic = Diagnostic.new(
        [
          0b00100,
          0b11110,
          0b10110,
          0b10111,
          0b10101,
          0b01111,
          0b00111,
          0b11100,
          0b10000,
          0b11001,
          0b00010,
          0b01010
        ]
      )
      expect(diagnostic.co2_rate).to eq(10)
    end
  end
end
