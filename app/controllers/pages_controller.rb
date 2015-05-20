class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show
    if @page.link.present?
      redirect_to @page.link
    end
    @title = @page.title
  end

  def new
    @page = Page.new
    @pagesList = Page.where("parent_id IS NULL", @page.slug).order(title: :asc)
  end

  def edit
    @pagesList = Page.where("parent_id IS NULL", @page.slug).order(title: :asc)
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    def set_page
      @page = Page.friendly.find(params[:id])
    end
    def page_params
      params.require(:page).permit(:title, :text, :parent_id, :link)
    end
end
