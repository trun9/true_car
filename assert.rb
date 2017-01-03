require 'set'
module Assert
  @errors = nil
  def identical?(obj1, obj2)
    @errors = Set.new
    object_to_dot_notation(obj1, obj2)
    if @errors.length != 0
      @errors.collect.each do |i|
        STDERR.puts i.to_s
      end
      false
    else
      true
    end
  end

  def object_to_dot_notation(obj, obj2, path="")
    scaler_data_types = [(Fixnum), (Float), (String), (NilClass)]
    if scaler_data_types.include? obj.class and scaler_data_types.include? obj2.class
      if obj != obj2
        if path == ""
          path = 'root'
        end
        @errors.add("StandardError, #{obj.to_s} != #{obj2.to_s} found at #{path}")
      end
    elsif obj.class == (Hash) and obj2.class == (Hash)
      keys = obj.keys + obj2.keys
      keys.each do |key|
        if obj.keys.include? key and obj2.keys.include? key
          if path == ""
            path1 = "[#{key}]"
          else
            path1 = "#{path}.[#{key}]"
          end
          object_to_dot_notation(obj[key], obj2[key], path1)
        elsif obj.keys.include? key
          STDERR.puts("StandardError, #{obj2.to_s} does not contain key: #{key}")
          exit(false)
        else
          STDERR.puts("StandardError, #{obj.to_s} does not contain key: #{key}")
          exit(false)
        end
      end
    elsif obj.class == (Array) and obj2.class == (Array)
      if obj2.length != obj.length
        STDERR.puts("StandardError, #{obj} length does not equal #{obj2}")
        exit(false)
        # temp = obj
        # obj = obj2
        # obj2 = temp
      end
      obj.each_with_index do |value, index|
        if path == ""
          path1 = "[#{index}]"
        else
          path1 = "#{path}.[#{index}]"
        end
        object_to_dot_notation(value, obj2[index], path1)
      end
    end
  end
end

