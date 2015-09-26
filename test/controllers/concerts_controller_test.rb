require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase
  setup do
    @concert = concerts(:one)
    @user = User.first
    params = ActionController::Parameters.new({user: {}})
  end

  test "should get index" do
    get :index, band_id: 1
    assert_response :success
    assert_not_nil assigns(:concerts)
  end

  test "should get new" do
    get :new,band_id: 1
    assert_response :success
  end

  test "should create concert" do
    assert_difference('Concert.count') do
      post :create, concert: { band_id: @concert.band_id, location: @concert.location, position: @concert.position }
    end

    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should show concert" do
    get :show, id: @concert, band_id: 1
    assert_response :success
  end

  test "should update concert" do
    patch :update, id: @concert, concert: { band_id: @concert.band_id, location: @concert.location, position: @concert.position }, band_id: 1
    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should destroy concert" do
    assert_difference('Concert.count', -1) do
      delete :destroy, id: @concert, band_id: 1
    end

    assert_redirected_to concerts_path
  end
end
