class MaintenanceRequest < ApplicationRecord
  belongs_to :station
  belongs_to :user
end
