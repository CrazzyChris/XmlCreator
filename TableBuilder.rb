require './FillWithContent'

class TableBuilder

  include FillElementWithContent

  def initialize(row_count,column_count,table_title="Simple Table")

    tablehead = "<table tabledef=\"cals\"><title>#{table_title}</title><tgroup cols=\"#{column_count}\">"

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
        tablerows += "<entry align=\"left\">placeholder</entry>"
      end
      tablerows += "</row>"
    end

    tableend = "</tbody></tgroup></table>"
    @table = tablehead + tablecolspec + tablerows + tableend
  end

  def return_table
    @table
  end

  def fill_with_content
    FillElementWithContent::fixed_content(@table,10)
  end

  def fill_with_random_content
    FillElementWithContent::random_content(@table,10)
  end

  def fill_with_content_with_tc(tc_author)
    FillElementWithContent::fixed_content_with_track_changes(@table,10,tc_author)
  end

  def fill_with_random_content_with_tc(tc_author)
    FillElementWithContent::random_content_with_track_changes(@table,10,tc_author)
  end

end
