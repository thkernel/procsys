class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	#before_action :create_company

	layout 'dashboard'
	
	def index

		@tasks = Task.all

		if current_user.status == 'enable'
			
		else
			redirect_to unauthorize_path
		end

		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	def create_company
		company = Company.all
		if  company.blank? && is_admin?
			redirect_to new_company_path
		end
	end

	
	
	

	
	

end