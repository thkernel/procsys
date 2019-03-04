module ApplicationHelper

    def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
	end
	
	def resource_class
		User
	end
	
	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	end
	
	def get_role_name(role_id)
		role = Role.find(role_id)
		role.name
	end

	def get_customer_fullname(customer_id)
		customer = Customer.find(customer_id)
		customer.full_name
	end

	def get_order_type_name(id)
		order_type = OrderType.find(id)
		order_type.name
	end
	def get_order_status_name(id)
		order_status = OrderStatus.find(id)
		order_status.name
	end


	def get_service_name(service_id)
		service = Service.find(service_id)
		service.name
	end

	def get_user_fullname(id)
		user = User.find(id)
		user.full_name
	end

	def get_motif_name(id)
		motif = Motif.find(id)
		motif.name
	end

	def get_order_ref(id)
		order = Order.find(id)
		order.ref
	end

	def get_work_order_ref(id)
		work_order = WorkOrder.find(id)
		work_order.id
	end

	def get_station_ref(id)
		station = Station.find(id)
		station.ref
	end

	def is_admin?
		if  get_role_name(current_user.role_id) == 'Administrateur'
			true
		else
			false
		end

	end

	def is_utilisateur?
		if  get_role_name(current_user.role_id) == 'Utilisateur'
			true
		else
			false
		end

	end

	

	

	def not_admin_or_superadmin?
		if  current_user.role != 'Admin' && current_user.role != 'Superadmin'
			true
		else
			false
		end

	end

	def not_admin_or_superadmin(user)
		if  user.role != 'Admin' && user.role != 'Superadmin'
			true
		else
			false
		end

	end


	def have_commission_settings?(user)
		if user.commission_setting.present?
			true
		else
			false
		end
	end

	def have_mail_settings?(user)
		if user.mail_configuration.present?
			true
		else
			false
		end
	end

	def is_producer?(user) 
		if user.present? 
			if user.role == 'Producteur'
				true 
			else
				false 
			end
		end
	end

	def is_contributor?(user) 
		if user.present? 
			if user.role == 'Apporteur'
				true 
			else
				false 
			end
		end
	end

	def is_contributor_or_producer?(user) 
		if user.present? 
			if user.role == 'Apporteur' || user.role == 'Producteur'
				true 
			else
				false 
			end
		end
	end

	

	def credit_acte_date(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.acte_date if credit.acte_date.present?
	end

	def credit_customer_name(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		if credit.present?
			credit.customer_name 
		end
	end

	def unregistered_commission_percentage?
		
		users = User.find_user_by_role('Apporteur','Producteur' )
		status = false
		users.each do |user_id|
			
			user_commission_percentage = CommissionSetting.find_by(user_id: user_id)

			if user_commission_percentage.present?
				status = false
			else
				status = true
			end
		end

		return status

	end

	def is_main_admin?(user)
		
		super_admin = User.find_by(role: 'Superadmin')

		if user.created_by == super_admin.id
			return true
		else
			return false
		end
	end

	def get_main_admin(user)
		
		if is_main_admin?(user)
			return user
		else
			main_admin = User.find_by(id: user.created_by)
		end
	end

	def get_app_name(user)
		if is_main_admin?(user)
			user_app_config = user.app_config  
			if user_app_config.present?
				app_name = user_app_config.name
			end
		elsif is_superadmin?
			app_name = "COSMOPOL"
		else
			main_admin = User.find_by(id: user.created_by)
			user_app_config = main_admin.app_config 
			if user_app_config.present?
				app_name = user_app_config.name
			end
		end
	end

	def current_company
	
		company = Company.take
		if company.present?
			company
		end
		
	end


	def get_admin_company(user)
		if is_main_admin?(user)
			user_app_company = user.company 
			if user_app_company.present?
				company = user_app_company
			end
		else
			
			main_admin = User.find_by(id: user.created_by)

			if main_admin.present?
				user_app_company = main_admin.company
				 
				if user_app_company.present?
					company = user_app_company
				end
			end
			
		end
	end

	def is_account_locked?(user)
		if user.status == 'enable'
			false
		else
			true
		end
	end

	def is_app_name_exist?(user)
		app_name = get_app_name(user)
		if app_name.present?
			true
		else
			false
		end
	end

	def bank_name(id)
		bank = Bank.find(id)
		bank.name
	end

	def completed?(status)
		if status == 'yes'
			true
		else
			false
		end
	end
	def current_company
		company = Company.first
	end
end
