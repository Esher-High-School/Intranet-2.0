require 'test_helper'

class HandbookCategoriesControllerTest < ActionController::TestCase
  setup do
    @handbook_category = handbook_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:handbook_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create handbook_category" do
    assert_difference('HandbookCategory.count') do
      post :create, handbook_category: { title: @handbook_category.title }
    end

    assert_redirected_to handbook_category_path(assigns(:handbook_category))
  end

  test "should show handbook_category" do
    get :show, id: @handbook_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @handbook_category
    assert_response :success
  end

  test "should update handbook_category" do
    patch :update, id: @handbook_category, handbook_category: { title: @handbook_category.title }
    assert_redirected_to handbook_category_path(assigns(:handbook_category))
  end

  test "should destroy handbook_category" do
    assert_difference('HandbookCategory.count', -1) do
      delete :destroy, id: @handbook_category
    end

    assert_redirected_to handbook_categories_path
  end
end
