# == Schema Information
#
# Table name: unavailabilities
#
#  id                  :bigint(8)        not null, primary key
#  actor               :integer
#  unavailability_date :datetime
#  description         :text
#  user_id             :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class UnavailabilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
