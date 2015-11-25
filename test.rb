require './ElementCreators'
require './ListOperations'
require './ListCreator'
require './ParagraphCreator'
require './HeaderCreator'
require './TableCreator'
require './FillWithContent'

include CreateString
include TrackChanges

test = "<ol><li outputclass=\"1\">placeholder</li><li outputclass=\"2\">placeholder</li><li outputclass=\"3\">placeholder</li></ol>"

test.gsub!("placeholder") {|placeholder| create_string(rand(5..10))}
p test

#test_with_track_changes = add_track_changes_to_string(test,'deletion', 'KTest1')

#p test_with_track_changes

table = CreateTableTest.new(3,3)
table.fill_with_random_content
p table.return_table
header = CreateHeaderTest.new(2)
header.fill_with_random_content_with_tc("Ktest1")
p header.return_header
