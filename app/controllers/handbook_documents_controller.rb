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

    respond_to do |format|
      if @handbook_document.save
        format.html { redirect_to @handbook_document, notice: 'Handbook document was successfully created.' }
        format.json { render :show, status: :created, location: @handbook_document }
      else
        format.html { render :new }
        format.json { render json: @handbook_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @handbook_document.update(handbook_document_params)
        format.html { redirect_to @handbook_document, notice: 'Handbook document was successfully updated.' }
        format.json { render :show, status: :ok, location: @handbook_document }
      else
        format.html { render :edit }
        format.json { render json: @handbook_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @handbook_document.destroy
    respond_to do |format|
      format.html { redirect_to handbook_documents_url, notice: 'Handbook document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_handbook_category
      @handbook_category = HandbookCategory.friendly.find(params[:handbook_category_id])
    end
    def set_handbook_document
      @handbook_document = HandbookDocument.friendly.find(params[:id])
    end

    def handbook_document_params
      params.require(:handbook_document).permit(:title, :category_id, :slug)
    end
end
