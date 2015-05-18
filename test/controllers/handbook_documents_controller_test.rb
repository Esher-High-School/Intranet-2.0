require 'test_helper'

class HandbookDocumentsControllerTest < ActionController::TestCase
  setup do
    @handbook_document = handbook_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:handbook_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create handbook_document" do
    assert_difference('HandbookDocument.count') do
      post :create, handbook_document: { category_id: @handbook_document.category_id, slug: @handbook_document.slug, title: @handbook_document.title }
    end

    assert_redirected_to handbook_document_path(assigns(:handbook_document))
  end

  test "should show handbook_document" do
    get :show, id: @handbook_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @handbook_document
    assert_response :success
  end

  test "should update handbook_document" do
    patch :update, id: @handbook_document, handbook_document: { category_id: @handbook_document.category_id, slug: @handbook_document.slug, title: @handbook_document.title }
    assert_redirected_to handbook_document_path(assigns(:handbook_document))
  end

  test "should destroy handbook_document" do
    assert_difference('HandbookDocument.count', -1) do
      delete :destroy, id: @handbook_document
    end

    assert_redirected_to handbook_documents_path
  end
end
