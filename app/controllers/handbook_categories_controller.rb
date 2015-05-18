class HandbookCategoriesController < ApplicationController
  before_action :set_handbook_category, only: [:show, :edit, :update, :destroy]

  # GET /handbook_categories
  # GET /handbook_categories.json
  def index
    @handbook_categories = HandbookCategory.all
  end

  # GET /handbook_categories/1
  # GET /handbook_categories/1.json
  def show
  end

  # GET /handbook_categories/new
  def new
    @handbook_category = HandbookCategory.new
  end

  # GET /handbook_categories/1/edit
  def edit
  end

  # POST /handbook_categories
  # POST /handbook_categories.json
  def create
    @handbook_category = HandbookCategory.new(handbook_category_params)

    respond_to do |format|
      if @handbook_category.save
        format.html { redirect_to @handbook_category, notice: 'Handbook category was successfully created.' }
        format.json { render :show, status: :created, location: @handbook_category }
      else
        format.html { render :new }
        format.json { render json: @handbook_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /handbook_categories/1
  # PATCH/PUT /handbook_categories/1.json
  def update
    respond_to do |format|
      if @handbook_category.update(handbook_category_params)
        format.html { redirect_to @handbook_category, notice: 'Handbook category was successfully updated.' }
        format.json { render :show, status: :ok, location: @handbook_category }
      else
        format.html { render :edit }
        format.json { render json: @handbook_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handbook_categories/1
  # DELETE /handbook_categories/1.json
  def destroy
    @handbook_category.destroy
    respond_to do |format|
      format.html { redirect_to handbook_categories_url, notice: 'Handbook category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handbook_category
      @handbook_category = HandbookCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handbook_category_params
      params.require(:handbook_category).permit(:title)
    end
end
