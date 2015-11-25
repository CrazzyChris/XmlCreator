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

module CreateString

include TrackChanges

def shorten_string(string, temp_lngth,last=false)

  for i in 1..temp_lngth.to_s.length
    until string.length == temp_lngth - temp_lngth.to_s.length
      string.chop!
    end

    string.chop!
    string.insert(-1,"*")
    string.insert(-1,"#{temp_lngth}")
    last ? temp_lngth : temp_lngth += 1

  end

end

def create_string(lngth, prd=8, track_changes=false,track_changes_type="insertion")

  string="1"

  while string.length <= lngth

    for i in 1..prd
      string.length == lngth ? break : string.insert(-1,"*")
    end

    string.insert(-1,"#{string.length}")
    shorten_string(string,string.length)

  end

  shorten_string(string,lngth,true)

  track_changes ? add_track_changes_to_string(string,track_changes_type) : string

end

end

module ElementCreators

include CreateString

end
