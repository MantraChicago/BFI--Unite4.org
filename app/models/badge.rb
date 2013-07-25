class Badge < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :description, :file_name, :accomplishment, :description_after, :description_before, :category, :type, :sub_text
  has_and_belongs_to_many :users, :join_table=>:users_badges

  validates_presence_of :name, :accomplishment
  validates_uniqueness_of :accomplishment, :name

  before_save :set_defaults

  can_be_queried_by :user_id

  has_attached_file  :image, :styles => { :medium => "300x300>", :thumb => "150x150>", :cause_tile => "81x81#" }, :default_url => "/assets/badges/new_user.png"

  def set_defaults
    self.file_name ||= "#{ self.name.parameterize }.png"
  end

  def self.query(params={})
    results = scoped
    results = results.where(user_id: params[:user_id]) if params[:user_id]

    results
  end


  DefaultBadges = [
     {name: 'Checking It Out', file_name: 'checking_it_out.png',description_after: "You visited your first cause page on $DATE. Why don't you check back in with $CAUSE and see if there's anything you can do for them now.", description_before: "Earn this badge by visiting one cause. Why not try one of the causes below?",category: 'Learning', type: 'one_time', sub_text: 'Get to know your first cause'},
      {name: 'Keeping Tabs', file_name: 'keeping_tabs.png',description_after: "You followed your first cause page on $DATE. Have you kept tabs on them through your follow page?", description_before: "Earn this badge by following one cause. Following causes let's you keep tabs on their new projects and donation drives. Why not check out one of the causes below?",category: 'Learning', type: 'one_time', sub_text: 'Follow one cause'},
      {name: 'Goodie Goodie', file_name: 'goodie_goodie.png',description_after: "You followed your first cause page on $DATE. Have you kept tabs on them through your follow page?", description_before: "Earn this badge by following one cause. Following causes let's you keep tabs on their new projects and donation drives. Why not check out one of the causes below?",category: 'Giving', type: 'one_time', sub_text: 'Donate to your first cause'},
      {name: 'Chatty Cathy', file_name: 'chatty_cathy.png',description_after: "You chatted up an awesome cause to your friends.", description_before: "Earn this badge by sharing causes through the social media/email links on each cause page. Letting more people know what they can do to help is awesome! Need some ideas of causes to share?",category: 'Sharing', type: 'one_time', sub_text: 'Tell your friends about your new favorite cause'},
      {name: 'Video Viking', file_name: 'video_viking.png',description_after: 'You conquered that video like a true viking!', description_before: 'Need to know more about a cause before you commit? Earn this badge by kicking back and watching a video about one of these causes.',category: 'Learning', type: 'one_time', sub_text: 'Kick back and check out a video'},
      {name: 'Getting Out There', file_name: 'getting_out_there.png',description_after: "You let #CAUSE know that you were ready to get out there and help them out.", description_before: "Got the will but not the way? Pick a cause from below and let them know that you're ready to volunteer!",category: 'Giving', type: 'one_time', sub_text: 'Let a cause know you want to help them'},
      {name: 'Cinema Buff', file_name: 'cinema_buff.png',description_after: '', description_before: "Become a true cinema buff by watching more cause videos. Here's a few recommendations for your playlist.",category: 'Learning', type: 'Repeat_able', sub_text: 'Keep on checking out those videos'},
      {name: 'Enthusiast', file_name: 'enthusiast.png',description_after: '', description_before: "There are so many causes, and it can be hard to remember which ones you've visited...unless you're following them, that is!" ,category: 'giving', type: 'repeat_able', sub_text: 'Spread your wealth around!'},
      {name: 'Doler of Dollars', file_name: 'doler_of_dollars.png',description_after: '', description_before: "Supporting causes financially allows them to support the community with goods and services.",category: 'giving', type: 'repeat_able', sub_text: 'Spread your wealth around!'},
      {name: 'Megaphone', file_name: 'megaphone.png',description_after: '', description_before: "It's time to start chatting up your favorite causes - the more people who know about causes, the more help they see. Think about sharing these causes that you've visited with your friends.",category: 'sharing', type: 'repeat_able', sub_text: 'Tell your friends!'},  
      {name: 'Dirt Under Your Fingernails', file_name: 'dirt_under_your_fingernails.png',description_after: '', description_before: "Volunteering can be dirty work sometimes, but it's also really rewarding. Here are a few causes that you have followed or visited that really need a little extra person power - let them know that you can do it!",category: 'giving', type: 'repeat_able', sub_text: 'Let 5 causes know how you can help them out'},
      {name: "We're Not So Far Away", file_name: 'were_not_so_far_away.png',description_after: "You earned this special badge by visiting 5 global outreach causes.", description_before: "Each and every day, the world gets a little bit smaller, thanks to you and your interest in global outreach.",category: 'learning', type: 'theme', sub_text: 'Learn about 5 global outreach causes'},
      {name: 'Patrons of the Arts', file_name: 'patrons_of_the_arts.png',description_after: 'You earned this special badge by visiting 5 global outreach causes.', description_before: "The sights and sounds of the artists' muse fill the air, thanks to you, fine patron of the arts.",category: 'learning', type: 'theme', sub_text: 'Learn about 5 art causes'},
      {name: 'Almsgiver', file_name: 'almsgiver.png',description_after: 'You earned this special badge by visiting 5 religious causes.', description_before: 'Religious organizations support their communities, and you support them by checking out their pages.',category: 'learning', type: 'theme', sub_text: 'Learn about 5 religion theme pages'},  
      {name: 'Apple A Day', file_name: 'apple_a_day.png',description_after: 'Learn about 5 Health and Wellness causes.', description_before: "You're tossing apples left and right, supporting health and wellness for everybody.",category: 'learning', type: 'theme', sub_text: 'Learn about 5 Health and Wellness causes'},   
      {name: 'It Takes a Village', file_name: 'takes_a_village.png',description_after: 'You earned this special badge by visiting 5 youth-centered causes.', description_before: "When it comes to supporting youth causes, you've already adopted the mentality of a member of the village.",category: 'learning', type: 'theme', sub_text: 'Visit 5 youth theme pages'},
      {name: 'Lifelong Longer', file_name: 'lifelong_learner.png',description_after: 'You earned this special badge by visiting 5 education causes.', description_before: "You're getting straight-a's today by being a lifelong learner and browsing education causes.",category: 'learning', type: 'theme', sub_text: 'Learn 5 education theme pages'},  
      {name: 'Equality for All', file_name: 'equality_for_all.png',description_after: 'You earned this special badge by visiting 5 social equality causes.', description_before: "Social inequality is a hard cause to tackle, but you know there's no rest until there's equality for all.",category: 'learning', type: 'theme', sub_text: 'Learn about 5 social equality causes'},  
      {name: 'Treehugger', file_name: 'treehugger.png',description_after: 'You earned this special badge by visiting 5 environmental cause pages.', description_before: 'The earth can breathe a bit easier, with you checking out all of these environmental causes.',category: 'learning', type: 'theme', sub_text: 'Learn about 5 Environmental causes'},
      {name: 'Sample Platter', file_name: 'sample_platter.png',description_after: 'You earned this special badge by visiting causes from each theme.', description_before: 'Look at you, learning a little bit about everything.',category: 'learning', type: 'theme', sub_text: 'Well-rounded supporter, learning about all subjects!'},  
      {name: 'Gotta Earn Them All', file_name: 'gotta_earn_them_all.png',description_after: "You're nerdy, generous and curious - what more could anyone ask for?", description_before: "You think you've got what it takes to get all of the badges? Prove it and collect them all! Check out these individual badge pages to find out what you have to do.",category: 'none', type: 'one_time', sub_text: 'Nerdy, generous and curious.'},  
      {name: 'Nerdy Supporter', file_name: 'nerdy_supporter.png',description_after: "Now everyone knows that you're awfully bright!", description_before: "We know you're clever,but how will anyone else know it if you don't have a nerdy supporter badge to show off?",category: 'learning', type: 'one_time', sub_text: 'Get educated: Earn one of each of the other learning badges!'}, 
      {name: 'Generous Supporter', file_name: 'generous_supporter.png',description_after: "Your generosity knows no bounds and now you've got proof!", description_before: "It's time to really explore what it means to give. Check out what kinds of giving you can do with unite4good by earning these two badges.",category: 'giving', type: 'one_time', sub_text: 'A variety of gifts: Earn one of each of the giving badges!'}, 
      {name: 'Curiouser and Curiouser', file_name: 'curiouser_and_curiouser.png',description_after: 'You know how to get heard, and how to bring attention to causes that deeply matter to you.', description_before: 'You have one powerful tool for helping causes out no matter your income level or amount of time - your voice!',category: 'sharing', type: 'one_time', sub_text: 'Make sure all your friends know about your causes: Earn 5 megaphone badges!'}, 
  ]

  def self.create_defaults should_delete=false
    delete_all if should_delete

    DefaultBadges.each do |badge_attributes|
      Badge.create(badge_attributes)
    end
  end
end

# == Schema Information
#
# Table name: badges
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  file_name      :string(255)
#  accomplishment :string(255)
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

