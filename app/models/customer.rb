# == Schema Information
#
# Table name: customers
#
#  id                  :bigint(8)        not null, primary key
#  company             :string
#  first_name          :string
#  last_name           :string
#  gender              :string
#  address             :string
#  city                :string
#  country             :string
#  phone               :string
#  slug                :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :bigint(8)
#  avatar_updated_at   :datetime
#  status              :boolean          default(TRUE)
#  user_id             :bigint(8)        not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders
end
