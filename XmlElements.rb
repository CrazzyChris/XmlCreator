require './ElementCreators'
include ElementCreators

require './ParagraphBuilder'
require './HeaderBuilder'
require './ListBuilder'
require './TableBuilder'
require './PictureBuilder'

module XmlElements

def is_default_element?(element)
  element == 1 ? true : false
end

def element_name_to_xml(element)
  element_name = /(\w+[ \d]*)/.match(element)[1]
  element_length = /\((\d+)\)/.match(element)[1]
  case element_name
  when "paragraph"
    paragraph = ParagraphBuilder.new()
    paragraph.fill_with_content
    paragraph.return_paragraph
  when "paragraph_tc"
    paragraph = ParagraphBuilder.new()
    paragraph.fill_with_content_with_tc
    paragraph.return_paragraph
  when "header 1"
    header = HeaderBuilder.new(1)
    header.fill_with_content
    header.return_header
  when "header 2"
    header = HeaderBuilder.new(2)
    header.fill_with_content
    header.return_header
  when "header 3"
    header = HeaderBuilder.new(3)
    header.fill_with_content
    header.return_header
  when "header 4"
    header = HeaderBuilder.new(4)
    header.fill_with_content
    header.return_header
  when "unordered list"
    list = ListBuilder.new("unordered",3)
    list.fill_with_content
    list.return_list
  when "ordered list"
    list = ListBuilder.new("ordered",3)
    list.fill_with_content
    list.return_list
  when "simple embedded table"
    table = TableBuilder.new(3,3,"Test Title")
    table.fill_with_content
    table.return_table
  when "picture"
    picture = PictureBuilder.new("test")
    picture.return_picture
  when "figure"
    figure = PictureBuilder.new("test",true)
    figure.fill_description_with_content
    figure.return_figure
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
