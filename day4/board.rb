# frozen_string_literal: true

require 'byebug'

# This is a Bingo Class
class Bingo
  attr_accessor :boards, :numbers

  def initialize(boards, numbers)
    @boards = boards
    @numbers = numbers
    @winning_board = nil
  end

  def score
    winning_board.score * @last_number
  end

  def losing_score
    @losing_board.score * @losing_number
  end

  def winning_board
    @winning_board
  end

  def losing_boards
    boards.reject(&:bingo?)
  end

  def play
    numbers.each do |n|
      boards.each do |board|
        board.mark(n)

        if board.bingo? && @winning_board.nil?
          @winning_board = board
          @last_number = n
        end

        if @losing_board.nil? && losing_boards.length == 1
          @losing_board = losing_boards.first
        end

        if !@losing_board.nil? && @losing_board.bingo?
          @losing_number = n
          return
        end
      end
    end
  end
end

# This is a class Board
class Board
  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def score
    @rows.flatten.reject { _1 == 'x' }.inject(:+)
  end

  def columns
    @rows.transpose
  end

  def bingo?
    return false if @rows.empty? || @rows.all?(&:nil?)

    @rows.any? { |row| row.all? { |cell| cell == 'x' } } ||
      columns.any? { |column| column.all? { |cell| cell == 'x' } }
  end

  def mark(num)
    @rows.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        if cell == num
          @rows[x][y] = 'x'
        end
      end
    end
  end
end

if __FILE__ == $0
  numbers, *boardlines = File.readlines(ARGV.first)
  numbers = numbers.chomp.split(',').map(&:to_i)

  rows = []
  boards = []
  boardlines.each do |line|
    next if line.chomp == ''

    rows.push(line.split(' ').map(&:to_i))

    if rows.length == 5
      boards.push(Board.new(rows))
      rows = []
    end
  end

  bingo = Bingo.new(boards, numbers)
  bingo.play
  p bingo.losing_score
end
