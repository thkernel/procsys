# == Schema Information
#
# Table name: task_statuses
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  status      :boolean          default(TRUE)
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TaskStatus < ApplicationRecord
  belongs_to :user
end
