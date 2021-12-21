# frozen_string_literal: true

# PART ONE
def number_of_increases(input)
  input.each_cons(2).inject(0) do |count, (x, y)|
    count += 1 if x < y
    count
  end
end

# PART TWO
def windows(n, input)
  input.each_cons(n).map(&:sum)
end

if __FILE__ == $0
  input = File.readlines(ARGV.first).map(&:to_i)
  p number_of_increases(windows(3, input))
end
