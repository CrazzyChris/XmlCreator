def concatenate_xml(array)
  array.join("")
end

def create_elements_list(*args)
  i = 0
  elements_array = Array.new(args.length)
  args.each do |argument|
    elements_array[i] = argument
    i += 1
  end
  elements_array
end

def insert_xml_element_into_array(array,elements)
  for i in 0..array.length
    array[i] = elements[rand(0..elements.length-1)]
  end
  array
end

def create_list(size)

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

puts lngth
xml = Array.new(lngth,1)
#concatenate_xml(xml)

end

#puts create_list("medium")
#puts create_list("none")

xml = create_list("medium")
elements_array = create_elements_list("a1","b2","c3","d4","e5")
puts insert_xml_element_into_array(xml,elements_array).join(" ")

