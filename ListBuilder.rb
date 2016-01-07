require './FillWithContent'

class ListBuilder

  include FillElementWithContent

  def initialize(type,list_length,element_length = 10)

    case type
    when "ordered"
      @list = "<ol>"
      for i in 1..list_length
        @list += "<li outputclass=\"#{i}\">placeholder</li>"
      end
      @list += "</ol>"
    when "unordered"
      @list = "<ul>"
      for i in 1..list_length
        @list += "<li>placeholder</li>"
      end
      @list += "</ul>"
    else
      "not supported list type"
    end
    @element_length = element_length

  end

  def return_list
    @list
  end

  def fill_with_content
    FillElementWithContent::fixed_content(@list,@element_length)
  end

  def fill_with_random_content
    FillElementWithContent::random_content(@list,@element_length)
  end

  def fill_with_content_with_tc(tc_author)
    FillElementWithContent::fixed_content_with_track_changes(@list,@element_length,tc_author)
  end

  def fill_with_random_content_with_tc(tc_author)
    FillElementWithContent::random_content_with_track_changes(@list,@element_length,tc_author)
  end

end
