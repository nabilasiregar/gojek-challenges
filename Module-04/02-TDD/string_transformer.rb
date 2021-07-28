class StringTransformer
  def transform(word)
    return 'k' if word == 'b'
    return 'z' if word == 'a'
  end
end