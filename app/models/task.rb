class Task < ApplicationRecord
  belongs_to :service
  belongs_to :motif
  belongs_to :user
end
