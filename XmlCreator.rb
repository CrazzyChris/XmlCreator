require './XmlElements'
require './ListOperations'

include XmlElements
include ListOperations

xml = create_xml_base("medium")
elements_array = create_elements_list("paragraph","header 1","unordered list","simple embedded table","picture","figure")

is_elements_list_too_long?(elements_array, xml)

xml_text=insert_xml_element_into_array(xml,elements_array).join("")
p xml_text

File.open("test.xml", "w+") { |file| file.write(xml_text)}

