require './FillWithContent'

class HeaderBuilder

  include FillElementWithContent

  def initialize(header_level)
    @header = "<h#{header_level}>placeholder</h#{header_level}>"
  end

  def return_header
    @header
  end

  def fill_with_content
    FillElementWithContent::fixed_content(@header,10)
  end

  def fill_with_random_content
    FillElementWithContent::random_content(@header,10)
  end

  def fill_with_content_with_tc(tc_author)
    FillElementWithContent::fixed_content_with_track_changes(@header,10,tc_author)
  end

  def fill_with_random_content_with_tc(tc_author)
    FillElementWithContent::random_content_with_track_changes(@header,10,tc_author)
  end

end
