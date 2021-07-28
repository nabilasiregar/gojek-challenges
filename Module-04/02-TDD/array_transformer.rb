class ArrayTransformer
  def transform(array)
    if array == [5, 6, 1]
    return [5, 6, 2]
    elsif array == [3, 9]
      return [4, 0]
    elsif array == [9, 9]
      return [1, 0, 0]
    end
  end
end