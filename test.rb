require './ElementCreators'
require './ListOperations'
require './ListCreator'
require './FillWithContent'

include CreateString
include TrackChanges

test = "<ol><li outputclass=\"1\">placeholder</li><li outputclass=\"2\">placeholder</li><li outputclass=\"3\">placeholder</li></ol>"

test.gsub!("placeholder") {|placeholder| create_string(rand(5..10))}
p test

#test_with_track_changes = add_track_changes_to_string(test,'deletion', 'KTest1')

#p test_with_track_changes

list = CreateListTest.new("ordered",3)
list.fill_with_random_content
p list.return_list
list2 = CreateListTest.new("unordered",3)
list2.fill_with_random_content_with_tc("insertion","Ktest1")
p list2.return_list

def proc_return
  Proc.new { return "Proc.new"}.call
  return "proc_return method finished"
end

def lambda_return
  lambda { return "lambda" }.call
  #return "lambda_return method finished"
end

puts proc_return
puts lambda_return
