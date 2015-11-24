module TrackChanges

  def add_track_changes_to_string(string,type,author)
    track_changes_start = rand(1..string.length/2)
    track_changes_end = rand(track_changes_start..string.length)
    case type
    when 'insertion'
      string.insert(track_changes_end,"<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"end\"/>")
      string.insert(track_changes_start, "<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"start\" xt:author=\"Test1\"/>")
    when 'deletion'
      string.insert(track_changes_end,"<xt:delText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"end\"/>")
      string.insert(track_changes_start, "<xt:delText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"start\" xt:author=\"Test1\"/>")
    else
      abort("Such track changes type (#{type}) is not supported!")
    end
  end

end

module FillElementWithContent

  include CreateString

    $fill = lambda do |string_length,random,tc,tc_author|
      random ? string=create_string(rand(5..string_length)) : string=create_string(string_length)
      tc_type = ["insertion","deletion"]
      tc ? add_track_changes_to_string(string,tc_type.sample,tc_author) : string
    end

  def self.random_content(content,string_length)
    content.gsub!("placeholder") {|match| $fill.call(string_length,true,false,"")}#{|placeholder| create_string(rand(5..string_length))}
  end

  def self.fixed_content(content,string_length)
    content.gsub!("placeholder") {|match| $fill.call(string_length,false,false,"")}
  end

  def self.random_content_with_track_changes(content,string_length,tc_author="Ktest1")
    content.gsub!("placeholder") {|match| $fill.call(string_length,true,true,tc_author)}
  end

  def self.fixed_content_with_track_changes(content,string_length,tc_author="Ktest1")
    content.gsub!("placeholder") {|match| $fill.call(string_length,false,true,tc_author)}
  end

end
