# frozen_string_literal: true

require_relative '../day6/school'

RSpec.describe School do
  it 'passes with the first example data' do
    school = School.new([3, 4, 3, 1, 2])
    school.pass_days(80)
    expect(school.num_fish).to eq 5934
  end

  it 'has 1 value with 4 days' do
    school = School.new([4])
    school.tick
    expect(school.ages).to eq(
      {
        0 => 0,
        1 => 0,
        2 => 0,
        3 => 1,
        4 => 0,
        5 => 0,
        6 => 0,
        7 => 0,
        8 => 0
      }
    )
  end

  it 'creates a new fish when it resets to 0' do
    school = School.new([0])
    school.tick
    expect(school.ages).to eq(
      {
        0 => 0,
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0,
        6 => 1,
        7 => 0,
        8 => 1
      }
    )
  end
end
