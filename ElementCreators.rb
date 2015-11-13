module CreateString

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

def create_string(lngth, prd=8)

  string="1"

  while string.length <= lngth

    for i in 1..prd
      string.length == lngth ? break : string.insert(-1,"*")
    end

    string.insert(-1,"#{string.length}")
    shorten_string(string,string.length)

  end

  shorten_string(string,lngth,true)

  string

end

end

module TrackChanges

  def add_track_changes_to_string(string,type,author)
    track_changes_start = rand(1..string.length)
    track_changes_end = rand(track_changes_start..string.length)
    if type == 'insertion'
      string.insert(track_changes_start, "<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"start\" xt:author=\"Test1\"")
      string.insert(track_changes_end,"<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"end\"")
    if type == 'deletion'
      string.insert(track_changes_start, "<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"start\" xt:author=\"Test1\"")
      string.insert(track_changes_end,"<xt:insText xmlns:xt=\"urn:xpressauthor:trackchanges\" xt:action=\"end\"")
    else
      abort("Such track changes type is not supported!")
    end
  end
end

module CreateParagraph

  include CreateString

  def create_paragraph(max_string_length,random_length = true)
    random_length ? "<p>#{create_string(rand(1..max_string_length))}</p>" : "<p>#{create_string(max_string_length)}</p>"
  end

end

module CreateList

def create_list(lngth, is_ordered)

  if is_ordered
    list = "<ol>"
    for i in 1..lngth
      list += "<li outputclass=\"#{i}\">Test Element #{i}</li>"
    end
    list += "</ol>"
  else
    list = "<ul>"
    for i in 1..lngth
      list += "<li>Test Element #{i}</li>"
    end
    list += "</ul>"
  end


end

end

module CreateHeader

def create_header(header_level)
  "<h#{header_level}>Test Header #{header_level}</h#{header_level}>"
end

end

module CreateTable

def create_table(row_count,column_count)

  tablehead = "<table tabledef=\"cals\"><title>Simple Table</title><tgroup cols=\"#{column_count}\">"

  tablecolspec = ""
  for column in 1..column_count
    column_width = 100/column_count
    tablecolspec += "<colspec colname=\"#{column}\" colnum=\"#{column}\" colwidth=\"#{column_width}%\"/>"
  end
  tablecolspec +="<tbody>"

tablerows = ""
  for row in 1..row_count
    tablerows += "<row>"
    for column in 1..column_count
      tablerows += "<entry align=\"left\"><p>Element #{row}#{column}</p></entry>"
    end
    tablerows += "</row>"
  end

  tableend = "</tbody></tgroup></table>"
  tablehead + tablecolspec + tablerows + tableend
end

end

module CreatePicture

  def create_picture(picture_name, is_figure = false)
    picture_dir = Dir.pwd.tr("/","\\")
    if is_figure
      description = "Test Description"
      "<fig><image href=\"#{picture_dir}\\#{picture_name}.jpg\" /><desc>#{description}</desc></fig>"
    else
      "<image href=\"#{picture_dir}\\#{picture_name}.jpg\" />"
    end
  end

end

module ElementCreators

include CreateParagraph
include CreateList
include CreateHeader
include CreateTable
include CreatePicture

end
