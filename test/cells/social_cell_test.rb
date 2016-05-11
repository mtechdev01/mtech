require 'test_helper'

class SocialCellTest < Cell::TestCase
  test "show" do
    html = cell("social").(:show)
    assert html.match /<p>/
  end


end
