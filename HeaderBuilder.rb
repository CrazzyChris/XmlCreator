require './FillWithContent'

class HeaderBuilder

  include FillElementWithContent

  def initialize(header_level,header_length=20)
    @header = "<h#{header_level}>placeholder</h#{header_level}>"
    @header_length = header_length
  end

  def return_header
    @header
  end

  def fill_with_content
    FillElementWithContent::fixed_content(@header,@header_length)
  end

  def fill_with_random_content
    FillElementWithContent::random_content(@header,@header_length)
  end

  def fill_with_content_with_tc(tc_author)
    FillElementWithContent::fixed_content_with_track_changes(@header,@header_length,tc_author)
  end

  def fill_with_random_content_with_tc(tc_author)
    FillElementWithContent::random_content_with_track_changes(@header,@header_length,tc_author)
  end

end
