require "spec_helper"

describe User do
  let(:user) { create(:user) }
  let(:cause) { create(:cause, :skip_default_location => true) }
  let(:follower) { create(:follower, user: user, cause: cause) }

  it "should be presentable" do
    User.new.should respond_to(:present_as)
  end

  it "should be awarded a default badge" do
    user.badges.count.should == 1
  end

  it "should give me a list of the cause ids that I follow" do
    follower.user.followed_causes_ids.should include(cause.id)
  end

  it "should allow me to unfollow a cause" do
    user = follower.user
    user.unfollow(cause)
    user.followed_causes_ids.should be_empty
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  bio                    :text
#  city                   :string(255)
#  state                  :string(255)
#  level                  :integer          default(0)
#  provider               :string(255)
#  uid                    :string(255)
#  game_id                :integer
#  fb_token               :text
#  role                   :string(255)
#  followers_count        :integer          default(0)
#  cash_donations_count   :integer          default(0)
#  goods_donations_count  :integer          default(0)
#  volunteers_count       :integer          default(0)
#  authentication_token   :string(255)
#  cause_admin            :boolean
#  cause_admin_id         :integer
#

