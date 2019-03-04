class PrestatorsController < ApplicationController
  before_action :set_prestator, only: [:show, :edit, :update, :destroy]

  # GET /prestators
  # GET /prestators.json
  def index
    @prestators = Prestator.all
  end

  # GET /prestators/1
  # GET /prestators/1.json
  def show
  end

  # GET /prestators/new
  def new
    @prestator = Prestator.new
  end

  # GET /prestators/1/edit
  def edit
  end

  # POST /prestators
  # POST /prestators.json
  def create
    @prestator = Prestator.new(prestator_params)

    respond_to do |format|
      if @prestator.save
        format.html { redirect_to @prestator, notice: 'Prestator was successfully created.' }
        format.json { render :show, status: :created, location: @prestator }
      else
        format.html { render :new }
        format.json { render json: @prestator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestators/1
  # PATCH/PUT /prestators/1.json
  def update
    respond_to do |format|
      if @prestator.update(prestator_params)
        format.html { redirect_to @prestator, notice: 'Prestator was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestator }
      else
        format.html { render :edit }
        format.json { render json: @prestator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestators/1
  # DELETE /prestators/1.json
  def destroy
    @prestator.destroy
    respond_to do |format|
      format.html { redirect_to prestators_url, notice: 'Prestator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestator
      @prestator = Prestator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestator_params
      params.require(:prestator).permit(:name, :address, :city, :phone, :country, :status, :user_id)
    end
end
