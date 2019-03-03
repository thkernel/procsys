# == Schema Information
#
# Table name: order_types
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  status      :boolean          default(TRUE)
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderType < ApplicationRecord
  belongs_to :user
  has_many :orders
  
end
