# frozen_string_literal: true

require_relative '../day2/submarine.rb'

RSpec.describe 'AimingSubmarine' do
  describe '.down' do
    it 'increases the submarine aim' do
      sub = AimingSubmarine.new
      expect(sub.aim).to eq 0
      sub.down(2)
      expect(sub.aim).to eq 2
    end
  end

  describe '.up' do
    it 'decreases the submarine aim' do
      sub = AimingSubmarine.new
      expect(sub.aim).to eq 0
      sub.up(2)
      expect(sub.aim).to eq -2
    end
  end

  describe '.forward' do
    it 'increases the submarine position by aim * n' do
      sub = AimingSubmarine.new
      expect(sub.position).to eq 0
      sub.down(2)
      sub.forward(3)
      expect(sub.position).to eq 3
      expect(sub.depth).to eq 2 * 3
    end
  end
end

RSpec.describe 'Submarine' do
  describe '.down' do
    it 'increases the depth' do
      sub = Submarine.new
      expect(sub.depth).to eq 0
      sub.down(10)
      expect(sub.depth).to eq 10
    end
  end

  describe '.up' do
    it 'decreases the depth' do
      sub = Submarine.new
      expect(sub.depth).to eq 0
      sub.down(10)
      sub.up(2)
      expect(sub.depth).to eq 8
    end
  end

  describe '.forward' do
    it 'increases the position' do
      sub = Submarine.new
      expect(sub.position).to eq 0
      sub.forward(2)
      expect(sub.position).to eq 2
    end
  end

  describe '.location' do
    it 'returns the position' do
      sub = Submarine.new do
        forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2
      end
      expect(sub.location).to eq 150
    end
  end
end
