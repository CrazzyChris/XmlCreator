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

module ElementCreators

include CreateString
include CreateList
include CreateHeader

def create_paragraph(string_length,random_length = true)
random_length ? "<p>#{create_string(rand(1..string_length))}</p>" : "<p>#{create_string(string_length)}</p>"
end

end
