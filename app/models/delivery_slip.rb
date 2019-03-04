class DeliverySlip < ApplicationRecord
  belongs_to :order
  belongs_to :customer
  belongs_to :user
end
