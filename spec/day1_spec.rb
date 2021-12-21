# frozen_string_literal: true

require_relative '../day1/number_of_increases.rb'

RSpec.describe 'number_of_increases' do
  it 'counts one increase' do
    number = number_of_increases([1,2])
    expect(number).to eq 1
  end

  it 'counts two increase' do
    number = number_of_increases([1,2,3])
    expect(number).to eq 2
  end

  it 'counts 7 increases' do
    input = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
    expect(number_of_increases(input)).to eq 7
  end
end
