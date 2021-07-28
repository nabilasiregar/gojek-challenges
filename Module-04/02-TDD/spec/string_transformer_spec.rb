require_relative '../string_transformer.rb'
RSpec.describe StringTransformer do
  it 'returns k if passed b' do
    string_transformer = StringTransformer.new
    result = string_transformer.transform('b')
    expect(result).to eq('k')
  end

  it 'returns z if passed a' do 
    string_transformer = StringTransformer.new
    result = string_transformer.transform('a')
    expect(result).to eq('z')
  end
end