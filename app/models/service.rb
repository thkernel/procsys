# == Schema Information
#
# Table name: services
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :user
end
