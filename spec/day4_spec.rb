# frozen_string_literal: true

require_relative '../day4/board'

RSpec.describe Bingo do
  it 'has the correct score' do
    board = Board.new(
      [
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15],
        [16, 17, 18, 19, 20],
        [21, 22, 23, 24, 25]
      ]
    )
    bingo = described_class.new([board], [1, 2, 3, 4, 5])
    bingo.play
    expect(bingo.winning_board).to eq board
    expect(bingo.score).to eq 1550
  end

  it 'has the correct score with multiple boards' do # rubocop:disable Metrics/BlockLength
    board1 = Board.new(
      [
        [22, 13, 17, 11, 0],
        [8, 2, 23, 4, 24],
        [21, 9, 14, 16, 7],
        [6, 10, 3, 18, 5],
        [1, 12, 20, 15, 19]
      ]
    )

    board2 = Board.new(
      [
        [3, 15, 0, 2, 22],
        [9, 18, 13, 17, 5],
        [19, 8, 7, 25, 23],
        [20, 11, 10, 24, 4],
        [14, 21, 16, 12, 6]
      ]
    )

    board3 = Board.new(
      [
        [14, 21, 17, 24, 4],
        [10, 16, 15, 9, 19],
        [18, 8, 23, 26, 20],
        [22, 11, 13, 6, 5],
        [2, 0, 12, 3, 7]
      ]
    )

    numbers = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]

    bingo = described_class.new([board1, board2, board3], numbers)
    bingo.play
    expect(bingo.score).to eq 4512
  end
end

RSpec.describe Board do # rubocop:disable Metrics/BlockLength
  describe '#mark' do
    it 'marks a number if it is in the grid' do
      grid = Array.new(5) { Array.new(5, nil) }
      grid[0][0] = 5
      board = described_class.new(grid)
      board.mark(5)
      expect(board.rows[0][0]).to eq 'x'
    end
  end

  describe '#bingo?' do
    it 'is false with empty board' do
      b = described_class.new(Array.new(5, nil))
      expect(b).not_to be_bingo
    end

    it 'is true for a bingo with a row' do
      grid = Array.new(5) { Array.new(5, nil) }
      5.times { |i| grid[0][i] = 'x' }
      board = described_class.new(grid)
      expect(board).to be_bingo
    end

    it 'is true for a bingo with a column' do
      grid = Array.new(5) { Array.new(5, nil) }
      5.times { |i| grid[i][0] = 'x' }
      board = described_class.new(grid)
      expect(board).to be_bingo
    end
  end
end
