require 'spec_helper'

describe Contribution do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: contributions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  cause_id         :integer
#  fulfilment_id    :integer
#  fulfilment_type  :string(255)
#  need_id          :integer
#  need_type        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fulfillment_type :string(255)
#  fulfillment_id   :integer
#

