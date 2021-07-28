require_relative "../src/facebook"

RSpec.describe WLI do
  it "two people likes this" do
  wli = WLI.new(["Willem", "Pauliina"])
  expect(wli.likes).to eq("Willem and Pauliina like this post")
  end

  it "three people likes this" do
  wli = WLI.new(["Nadia", "Louis", "Martin"])
  expect(wli.likes).to eq("Nadia, Louis, and Martin like this post")
  end 
end