class WorkOrder < ApplicationRecord
  belongs_to :maintenance_request
  belongs_to :user
end
