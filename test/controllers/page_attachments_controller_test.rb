require 'test_helper'

class PageAttachmentsControllerTest < ActionController::TestCase
  setup do
    @page_attachment = page_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_attachment" do
    assert_difference('PageAttachment.count') do
      post :create, page_attachment: { title: @page_attachment.title }
    end

    assert_redirected_to page_attachment_path(assigns(:page_attachment))
  end

  test "should show page_attachment" do
    get :show, id: @page_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_attachment
    assert_response :success
  end

  test "should update page_attachment" do
    patch :update, id: @page_attachment, page_attachment: { title: @page_attachment.title }
    assert_redirected_to page_attachment_path(assigns(:page_attachment))
  end

  test "should destroy page_attachment" do
    assert_difference('PageAttachment.count', -1) do
      delete :destroy, id: @page_attachment
    end

    assert_redirected_to page_attachments_path
  end
end
