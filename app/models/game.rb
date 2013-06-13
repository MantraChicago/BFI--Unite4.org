class Game < ActiveRecord::Base
   attr_accessible :level
end

# == Schema Information
#
# Table name: games
#
#  id                :integer          not null, primary key
#  level             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  show_instructions :boolean          default(TRUE)
#

