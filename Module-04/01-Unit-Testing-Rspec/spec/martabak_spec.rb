require_relative '../src/martabak'

RSpec.describe Martabak do
  it 'is delicious' do
    martabak = Martabak.new("cokelat")
    taste = martabak.taste
    expect(taste).to eq("martabak cokelat is delicious")
  end

  it 'keju is delicious' do
    martabak = Martabak.new("keju")
    taste = martabak.taste
    expect(taste).to eq("martabak keju is delicious")
  end
end

