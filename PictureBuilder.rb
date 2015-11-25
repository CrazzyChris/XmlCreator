class BuildPictureTest

  def initialize(picture_name,is_figure = false)
    picture_dir = Dir.pwd.tr("/","\\")
    if is_figure
      @figure = "<fig><image href=\"#{picture_dir}\\#{picture_name}.jpg\" /><desc>placeholder</desc></fig>"
    else
      @picture = "<image href=\"#{picture_dir}\\#{picture_name}.jpg\" />"
    end
  end

  def return_picture
    @picture
  end

  def return_figure
    @figure
  end

  def fill_description_with_content
    FillElementWithContent::fixed_content(@figure,10)
  end

  def fill_description_with_random_content
    FillElementWithContent::random_content(@figure,10)
  end

  def fill_description_with_content_with_tc(tc_author)
    FillElementWithContent::fixed_content_with_track_changes(@figure,10,tc_author)
  end

  def fill_description_with_random_content_with_tc(tc_author)
    FillElementWithContent::random_content_with_track_changes(@figure,10,tc_author)
  end

end
