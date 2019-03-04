class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = current_user.providers.build(provider_params)

    respond_to do |format|
      if @provider.save
        @providers = Provider.all
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
        format.js
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        @providers = Provider.all
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @provider = Provider.find(params[:provider_id])
  end
  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    @providers = Provider.all
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :address, :city, :phone, :country)
    end
end
