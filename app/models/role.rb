# == Schema Information
#
# Table name: roles
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  status      :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
    #belongs_to :user
end
