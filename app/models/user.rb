# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  login                  :string
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  service_id             :bigint(8)
#  created_by             :bigint(8)
#  role_id                :bigint(8)
#  position               :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint(8)
#  avatar_updated_at      :datetime
#  status                 :string           default("enable"), not null
#  receives_notifications :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  # For Paperclip usage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/avatar/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates_attachment :avatar,  :file_dimensions

	# Image dimensions validation
	def file_dimensions
		dimensions = Paperclip::Geometry.from_file(file.queued_for_write[:original].path)
		self.width = dimensions.width
		self.height = dimensions.height

		if dimensions.width < 200 && dimensions.height < 200
			errors.add(:file,'Width or height must be at least 50px')
		end
  end
  
end
