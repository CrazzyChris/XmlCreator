module FillElementWithContent

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
