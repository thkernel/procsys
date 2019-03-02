# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  login                  :string
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  service_id             :bigint(8)
#  created_by             :bigint(8)
#  role_id                :bigint(8)
#  position               :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint(8)
#  avatar_updated_at      :datetime
#  status                 :string           default("enable"), not null
#  receives_notifications :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
