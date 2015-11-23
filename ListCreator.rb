require './FillWithContent'

class CreateListTest

include FillElementWithContent

def initialize(type,length)

  case type
  when "ordered"
    @list = "<ol>"
    for i in 1..length
      @list += "<li outputclass=\"#{i}\">placeholder</li>"
    end
    @list += "</ol>"
  when "unordered"
    @list = "<ul>"
    for i in 1..length
      @list += "<li>placeholder</li>"
    end
    @list += "</ul>"
  else
    "not supported list type"
  end

end

def return_list
  @list
end

def fill_with_content
  FillElementWithContent::fixed_content(@list,10)
end

def fill_with_random_content
  FillElementWithContent::random_content(@list,10)
end

def fill_with_content_with_tc(tc_type,tc_author)
  FillElementWithContent::fixed_content_with_track_changes(@list,10,tc_type,tc_author)
end

def fill_with_random_content_with_tc(tc_type,tc_author)
  FillElementWithContent::random_content_with_track_changes(@list,10,tc_type,tc_author)
end

end
