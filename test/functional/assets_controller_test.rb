require 'test_helper'

class AssetsControllerTest < ActionController::TestCase

  def test_create
    Asset.any_instance.expects(:save).returns(true)
    post :create, :asset => { }
    assert_response :redirect
  end

  def test_create_with_failure
    Asset.any_instance.expects(:save).returns(false)
    post :create, :asset => { }
    assert_template "new"
  end

  def test_destroy
    Asset.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => assets(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  def test_destroy_with_failure
    Asset.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => assets(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  def test_edit
    get :edit, :id => assets(:one).to_param
    assert_response :success
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_show
    get :show, :id => assets(:one).to_param
    assert_response :success
  end

  def test_update
    Asset.any_instance.expects(:save).returns(true)
    put :update, :id => assets(:one).to_param, :asset => { }
    assert_response :redirect
  end

  def test_update_with_failure
    Asset.any_instance.expects(:save).returns(false)
    put :update, :id => assets(:one).to_param, :asset => { }
    assert_template "edit"
  end

end