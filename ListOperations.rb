module ListOperations

def create_elements_list(*args)
  i = 0
  elements_array = Array.new(args.length)
  args.each do |argument|
    elements_array[i] = argument
    i += 1
  end
  elements_array
end

def create_xml_base(size)

case size
  when "small"
    lngth=rand(1..5)
  when "medium"
    lngth=rand(6..20)
  when "large"
    lngth=rand(21..50)
  when "huge"
    lngth=rand(51..100)
  else
    abort("This size is not supported (That's what she said)")
end

puts "Your xml will have #{lngth} elements"
xml = Array.new(lngth,1)

end

def is_elements_list_too_long?(elements,array)
  abort("xml (length: #{array.length}) is too short for so many elements (#{elements.length})") if elements.length > array.length
end

end
