class Order < ApplicationRecord
  belongs_to :order_type
  belongs_to :customer
  belongs_to :user
end
