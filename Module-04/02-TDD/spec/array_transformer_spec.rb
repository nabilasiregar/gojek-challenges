require_relative '../array_transformer.rb'

RSpec.describe ArrayTransformer do
  it 'returns [5, 6, 2] if passed [5, 6, 1]' do
    array_transformer = ArrayTransformer.new
    result = array_transformer.transform([5, 6, 1])
    expect(result).to eq([5, 6, 2])
  end

  it 'returns [4, 0] if passed [3, 9]' do
    array_transformer = ArrayTransformer.new
    result = array_transformer.transform([3, 9])
    expect(result).to eq([4, 0])
  end

  it 'returns [1, 0, 0] if passed [9, 9]' do
    array_transformer = ArrayTransformer.new
    result = array_transformer.transform([9, 9])
    expect(result).to eq([1, 0, 0])
  end
end

