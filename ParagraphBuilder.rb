require './FillWithContent'

class ParagraphBuilder

  include FillElementWithContent

  def initialize

    @paragraph = "<p>placeholder</p>"

  end

  def return_paragraph
    @paragraph
  end

  def fill_with_content
    FillElementWithContent::fixed_content(@paragraph,10)
  end

  def fill_with_random_content
    FillElementWithContent::random_content(@paragraph,10)
  end

  def fill_with_content_with_tc(tc_author="Ktest1")
    FillElementWithContent::fixed_content_with_track_changes(@paragraph,10,tc_author)
  end

  def fill_with_random_content_with_tc(tc_author="Ktest1")
    FillElementWithContent::random_content_with_track_changes(@paragraph,10,tc_author)
  end

end
