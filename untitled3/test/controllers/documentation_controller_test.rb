require 'test_helper'

class DocumentationControllerTest < ActionDispatch::IntegrationTest
  test "should get docdumentation" do
    get documentation_doc_url
    assert_response :success
  end

end
