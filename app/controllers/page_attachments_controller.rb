class PageAttachmentsController < ApplicationController
  before_action :set_page_attachment, only: [:edit, :update, :destroy]

  def new
    @page = Page.friendly.find(params[:page_id])
    @page_attachment = PageAttachment.new
  end

  def edit
  end

  def create
    @page = Page.friendly.find(params[:page_id])
    @page_attachment = PageAttachment.new(page_attachment_params)
    @page_attachment.page_id = @page.id
    if @page_attachment.save
      redirect_to @page, notice: 'Page attachment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page_attachment.update(page_attachment_params)
      redirect_to @page_attachment, notice: 'Page attachment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page_attachment.destroy
    redirect_to @page, notice: 'Page attachment was successfully destroyed.'
  end

  private
    def set_page_attachment
      @page = Page.friendly.find(params[:page_id])
      @page_attachment = PageAttachment.find(params[:id])
    end

    def page_attachment_params
      params.require(:page_attachment).permit(:title, :attachment)
    end
end
