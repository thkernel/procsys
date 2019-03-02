# == Schema Information
#
# Table name: motifs
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  status      :boolean          default(TRUE)
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MotifTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
