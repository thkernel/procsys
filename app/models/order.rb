# == Schema Information
#
# Table name: orders
#
#  id            :bigint(8)        not null, primary key
#  ref           :string
#  order_date    :datetime
#  arrival_date  :datetime
#  order_type_id :bigint(8)
#  customer_id   :bigint(8)
#  status        :boolean          default(TRUE)
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :order_type
  belongs_to :customer
  belongs_to :user
  belongs_to :order_status
  has_many :tasks
end
