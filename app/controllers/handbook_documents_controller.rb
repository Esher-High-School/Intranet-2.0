class HandbookDocumentsController < ApplicationController
  before_action :set_handbook_category, :set_handbook_document, only: [:show, :edit, :update, :destroy]

  def index
    @handbook_category = HandbookCategory.friendly.find(params[:handbook_category_id])
    @handbook_documents = HandbookDocument.all
  end

  def show
  end

  def new
    @handbook_category = HandbookCategory.friendly.find(params[:handbook_category_id])
    @handbook_document = HandbookDocument.new
  end

  def edit
  end

  def create
    @handbook_document = HandbookDocument.new(handbook_document_params)

    if @handbook_document.save
      redirect_to handbook_category_handbook_documents_url(@handbook_category), notice: 'Handbook document was successfully created.'
    else
      render :new
    end
  end

  def update
    if @handbook_document.update(handbook_document_params)
      redirect_to handbook_category_handbook_documents_url(@handbook_category), notice: 'Handbook document was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @handbook_document.destroy
    redirect_to handbook_category_handbook_documents_url(@handbook_category), notice: 'Handbook document was successfully destroyed.'
  end

  private
    def set_handbook_category
      @handbook_category = HandbookCategory.friendly.find(params[:handbook_category_id])
    end
    def set_handbook_document
      @handbook_document = HandbookDocument.friendly.find(params[:id])
    end

    def handbook_document_params
      params.require(:handbook_document).permit(:title, :document)
    end
end