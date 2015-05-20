class HandbookCategoriesController < ApplicationController
  before_action :set_handbook_category, only: [:show, :edit, :update, :destroy]

  def index
    @handbook_categories = HandbookCategory.all.order('title ASC')
  end

  def cms_index
    @handbook_categories = HandbookCategory.all.order('title ASC')
  end

  def show
    @handbook_categories = HandbookCategory.all.order('title ASC')
    @newDocument = HandbookDocument.new
  end

  def new
    @handbook_category = HandbookCategory.new
  end

  def edit
  end

  def create
    @handbook_category = HandbookCategory.new(handbook_category_params)

    if @handbook_category.save
      redirect_to '/handbook/cms', notice: 'Handbook category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @handbook_category.update(handbook_category_params)
      redirect_to '/handbook/cms', notice: 'Handbook category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @handbook_category.destroy
    redirect_to '/handbook/cms', notice: 'Handbook category was successfully destroyed.'
  end

  private
    def set_handbook_category
      @handbook_category = HandbookCategory.friendly.find(params[:id])
    end

    def handbook_category_params
      params.require(:handbook_category).permit(:title)
    end
end
