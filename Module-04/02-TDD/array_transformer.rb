class ArrayTransformer
  def transform(array)
    if array.last > 8
      array = transformer_two(array)
    else
      array= transformer_one(array)
    end
  end

   def transformer_one(array)
    new_array = Array.new
    array_size = array.size
    cycle_count = array_size - 1
    first_add = array.cycle.take(cycle_count).each { |i|
      new_array << i
    }
    last_add = array.last + 1
    new_array << last_add
    return new_array
   end

   def transformer_two(array)
    get_first_index = array[0]
    increment_value = get_first_index + 1
    new_value = increment_value.to_s.scan(/./).map { |i| i.to_i }
    new_value << 0
    return new_value
   end
end