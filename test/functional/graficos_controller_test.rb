require 'test_helper'

class GraficosControllerTest < ActionController::TestCase
  test "should get action" do
    get :action
    assert_response :success
  end

  test "should get grafico1" do
    get :grafico1
    assert_response :success
  end

end
