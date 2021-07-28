class ArrayTransformer
  def transform(array)
    check_size = array.size
    iter_count = check_size - 1
    new_array = Array.new
    first_add = array.cycle.take(iter_count).each { |i|
      new_array << i
    }
    last_add = array.last + 1
    new_array << last_add
    return new_array

    # new_array = Array.new
    # first_array = array.slice(number_of_iterations).join(, )
    # new_array << first_array
    # last_array = array.last
    # last_array += 1
    # new_array << last_array



    # if array == [5, 6, 1]
    # return [5, 6, 2]
    # elsif array == [3, 9]
    #   return [4, 0]
    # elsif array == [9, 9]
    #   return [1, 0, 0]
    # end
  end
end