class PageAttachmentsController < ApplicationController
  before_action :set_page_attachment, only: [:show, :edit, :update, :destroy]

  # GET /page_attachments
  # GET /page_attachments.json
  def index
    @page_attachments = PageAttachment.all
  end

  # GET /page_attachments/1
  # GET /page_attachments/1.json
  def show
  end

  # GET /page_attachments/new
  def new
    @page_attachment = PageAttachment.new
  end

  # GET /page_attachments/1/edit
  def edit
  end

  # POST /page_attachments
  # POST /page_attachments.json
  def create
    @page_attachment = PageAttachment.new(page_attachment_params)

    respond_to do |format|
      if @page_attachment.save
        format.html { redirect_to @page_attachment, notice: 'Page attachment was successfully created.' }
        format.json { render :show, status: :created, location: @page_attachment }
      else
        format.html { render :new }
        format.json { render json: @page_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_attachments/1
  # PATCH/PUT /page_attachments/1.json
  def update
    respond_to do |format|
      if @page_attachment.update(page_attachment_params)
        format.html { redirect_to @page_attachment, notice: 'Page attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_attachment }
      else
        format.html { render :edit }
        format.json { render json: @page_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_attachments/1
  # DELETE /page_attachments/1.json
  def destroy
    @page_attachment.destroy
    respond_to do |format|
      format.html { redirect_to page_attachments_url, notice: 'Page attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_attachment
      @page_attachment = PageAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_attachment_params
      params.require(:page_attachment).permit(:title)
    end
end
