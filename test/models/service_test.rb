# == Schema Information
#
# Table name: services
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
