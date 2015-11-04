def is_default_element?(element)
  element == 1 ? true : false
end

def is_elements_list_too_long?(elements,array)
  abort("xml (length: #{array.length}) is too short for so many elements (#{elements.length})") if elements.length > array.length
end

def add_necessary_xml_elements(array, title, is_title_editable = true, has_summary = true)
  xml_beginning = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>"
  is_title_editable ? xml_beginning += "<?Xpress productLine=\"title-" : xml_beginning += "<?Xpress productLine=\"gentitle-"
  if has_summary
    xml_beginning += "summary-article\" ?><topic><prolog /><title>#{title}</title><summary /><body>"
  else
    xml_beginning += "article\" ?><topic><prolog /><title>#{title}</title><body>"
  end
  xml_ending = "</body><attachments /></topic>"
  array.unshift(xml_beginning)
  array.push(xml_ending)
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

def element_name_to_xml(element_name)
  case element_name
  when "paragraph"
    "<p>Test Paragraph</p>"
  when "header"
    "<h1>Test Header</h1>"
  when "unordered list"
    "<ul><li>Test Element 1</li><li>Test Element 2</li><li>Test Element 3</li></ul>"
  when "ordered list"
    "<ol><li outputclass=\"1.\">Test Element A</li><li outputclass=\"2.\">Test Element B</li><li outputclass=\"3.\">Test Element C</li></ol>"
  when "simple table"
    ""
  else
    abort("Not supported xml element")
  end
end

def insert_xml_element_into_array(array,elements)

  elements.each do |element|
    begin
      n = rand(0..array.length-1)
    end until is_default_element?(array[n])
    array[n] = element_name_to_xml(element)
#    p array
  end

  for i in 0..array.length
    index = rand(0..elements.length-1)
    array[i] = element_name_to_xml(elements[index]) if is_default_element?(array[i])
  end

  add_necessary_xml_elements(array,"Test Title")
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

puts "Your xml will have #{lngth} elements"
xml = Array.new(lngth,1)
#concatenate_xml(xml)

end

#puts create_list("medium")
#puts create_list("none")

xml = create_list("small")
elements_array = create_elements_list("paragraph","header","ordered list")
is_elements_list_too_long?(elements_array, xml)
text=insert_xml_element_into_array(xml,elements_array).join("")
p text

File.open("test.xml", "w+") { |file| file.write(text)}

