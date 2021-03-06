class MaintenanceReportsController < ApplicationController
  before_action :set_maintenance_report, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /maintenance_reports
  # GET /maintenance_reports.json
  def index
    @maintenance_reports = MaintenanceReport.all
  end

  # GET /maintenance_reports/1
  # GET /maintenance_reports/1.json
  def show
  end

  # GET /maintenance_reports/new
  def new
    @maintenance_report = MaintenanceReport.new
    @work_orders = WorkOrder.all
  end

  # GET /maintenance_reports/1/edit
  def edit
  end

  # POST /maintenance_reports
  # POST /maintenance_reports.json
  def create
    @maintenance_report = current_user.maintenance_reports.build(maintenance_report_params)

    respond_to do |format|
      if @maintenance_report.save
        @maintenance_reports = MaintenanceReport.all
        format.html { redirect_to @maintenance_report, notice: 'Maintenance report was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_report }
        format.js
      else
        format.html { render :new }
        format.json { render json: @maintenance_report.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /maintenance_reports/1
  # PATCH/PUT /maintenance_reports/1.json
  def update
    respond_to do |format|
      if @maintenance_report.update(maintenance_report_params)
        @maintenance_reports = MaintenanceReport.all
        format.html { redirect_to @maintenance_report, notice: 'Maintenance report was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_report }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @maintenance_report.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @maintenance_report = MaintenanceReport.find(params[:maintenance_report_id])
  end

  # DELETE /maintenance_reports/1
  # DELETE /maintenance_reports/1.json
  def destroy
    @maintenance_report.destroy
    @maintenance_reports = MaintenanceReport.all
    respond_to do |format|
      format.html { redirect_to maintenance_reports_url, notice: 'Maintenance report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_report
      @maintenance_report = MaintenanceReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_report_params
      params.require(:maintenance_report).permit(:motif, :description, :work_order_id)
    end
end
