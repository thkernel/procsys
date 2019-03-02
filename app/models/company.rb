# == Schema Information
#
# Table name: companies
#
#  id                 :bigint(8)        not null, primary key
#  name               :string           not null
#  address            :string
#  city               :string
#  country            :string
#  phone              :string
#  slug               :string
#  brand_file_name    :string
#  brand_content_type :string
#  brand_file_size    :bigint(8)
#  brand_updated_at   :datetime
#  user_id            :bigint(8)        not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Company < ApplicationRecord
  belongs_to :user
end
