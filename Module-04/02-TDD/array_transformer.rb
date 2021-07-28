class ArrayTransformer
  def transform(array)
    if array.last > 8
      array = transform_two(array)
    else
      array= transform_one(array)
    end
  end

   def transform_one(array)
    check_size = array.size
    iter_count = check_size - 1
    new_array = Array.new
    first_add = array.cycle.take(iter_count).each { |i|
      new_array << i
    }
    last_add = array.last + 1
    new_array << last_add
    return new_array
   end

   def transform_two(array)
    transform_array = array[0]
    increment_value = transform_array + 1
    get_value = increment_value.to_s.scan(/./).map { |i| i.to_i }
    get_value << 0
    return get_value
   end
end