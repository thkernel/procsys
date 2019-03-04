class DeliverySlipProcessing < ApplicationRecord
  belongs_to :delivery_slip
  belongs_to :motif
  belongs_to :user
end
