require './ElementCreators'
include ElementCreators

module XmlElements

def is_default_element?(element)
  element == 1 ? true : false
end

def element_name_to_xml(element_name)

  case element_name
  when "paragraph"
    create_paragraph(10,false)
  when "header 1"
    create_header(1)
  when "header 2"
    create_header(2)
  when "header 3"
    create_header(3)
  when "header 4"
    create_header(4)
  when "unordered list"
    create_list(3,false)
  when "ordered list"
    create_list(3,true)
  when "simple embedded table"
    create_table(3,3)
#    tablehead = "<table tabledef=\"cals\"><title>Simple Table</title><tgroup cols=\"3\">"
#    tablecolspec = "<colspec colname=\"1\" colnum=\"1\" colwidth=\"33.33%\"/><colspec colname=\"2\" colnum=\"2\" colwidth=\"33.33%\"/><colspec colname=\"3\" colnum=\"3\" colwidth=\"33.34%\"/><tbody>"
#    tablerow = "<row><entry align=\"left\"><p>aaa1</p></entry><entry align=\"left\"><p>aaa2</p></entry><entry align=\"left\"><p>aaa3</p></entry></row>"
#    tableend = "</tbody></tgroup></table>"
#    tablehead + tablecolspec + tablerow*3 + tableend
  when "picture"
    create_picture("test")
  when "figure"
    create_picture("test", true)
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

end
