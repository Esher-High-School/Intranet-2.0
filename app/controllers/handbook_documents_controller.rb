class HandbookDocumentsController < ApplicationController
  before_action :set_handbook_document, only: [:show, :edit, :update, :destroy]

  # GET /handbook_documents
  # GET /handbook_documents.json
  def index
    @handbook_documents = HandbookDocument.all
  end

  # GET /handbook_documents/1
  # GET /handbook_documents/1.json
  def show
  end

  # GET /handbook_documents/new
  def new
    @handbook_document = HandbookDocument.new
  end

  # GET /handbook_documents/1/edit
  def edit
  end

  # POST /handbook_documents
  # POST /handbook_documents.json
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

  # PATCH/PUT /handbook_documents/1
  # PATCH/PUT /handbook_documents/1.json
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

  # DELETE /handbook_documents/1
  # DELETE /handbook_documents/1.json
  def destroy
    @handbook_document.destroy
    respond_to do |format|
      format.html { redirect_to handbook_documents_url, notice: 'Handbook document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handbook_document
      @handbook_document = HandbookDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handbook_document_params
      params.require(:handbook_document).permit(:title, :category_id, :slug)
    end
end
