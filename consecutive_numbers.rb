test_array = [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7,8,7,6,5,6,7] 

def consecutive increment_array
    increment_array.each_with_index.map{|number, index| 
        test_chunk_ascending=*(increment_array[index]..increment_array[index]+2)
        test_chunk_descending=increment_array[index].downto(increment_array[index]-2).to_a
        actual_chunk=increment_array[index..index+2]
        
        index if test_chunk_ascending == actual_chunk || test_chunk_descending == actual_chunk
    }.compact
end

puts consecutive(test_array)    


