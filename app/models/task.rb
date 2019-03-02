# == Schema Information
#
# Table name: tasks
#
#  id              :bigint(8)        not null, primary key
#  service_id      :bigint(8)
#  contact         :integer
#  motif_id        :bigint(8)
#  time_limit      :datetime
#  processing_date :datetime
#  status          :boolean          default(TRUE)
#  user_id         :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :service
  belongs_to :motif
  belongs_to :user
end
