class Badge < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :slug, :description, :file_name, :accomplishment, :description_after, :description_before, :category, :badge_type, :sub_text, :is_active
  has_and_belongs_to_many :users, :join_table=>:users_badges


  before_save :set_defaults

  can_be_queried_by :user_id

  has_attached_file  :image, :styles => { :medium => "300x300>", :thumb => "150x150>", :cause_tile => "81x81#" }, :default_url => "/assets/badges/new_user.png"

  def set_defaults
    self.file_name ||= "#{ self.name.parameterize }.png"
  end

  def generate_badge_calculator_class_name
    "#{slug.camelize}Calculator"
  end

  def self.query(params={})
    results = scoped
    results = results.where(user_id: params[:user_id]) if params[:user_id]

    results
  end

  scope :active, lambda { where( :is_active => true ) } 

  DefaultBadges = [
      { is_active: true, name: 'Sign Up', slug: 'sign_up', file_name: 'sign_up.png',description_after: "Welcome to unite4:! You're all set to do good daily.", description_before: "Welcome to unite4! this was your very first badge! Check out the badge page to learn how you can earn more.", category: 'none', badge_type: 'one_time', sub_text: "Let's Get Started!"},
      { is_active: true, name: 'Checking It Out',  slug: 'checking_it_out', file_name: 'checking_it_out.png',description_after: "You visited your first cause page on $DATE. Why don't you check back in with $CAUSE and see if there's anything you can do for them now.", description_before: "Earn this badge by visiting one cause. Why not try one of the causes below?",category: 'Learning', badge_type: 'one_time', sub_text: 'Get to know your first cause'},
      { is_active: true, name: 'Keeping Tabs', slug: 'keeping_tabs', file_name: 'keeping_tabs.png',description_after: "You followed your first cause page on $DATE. Have you kept tabs on them through your follow page?", description_before: "Earn this badge by following one cause. Following causes let's you keep tabs on their new projects and donation drives. Why not check out one of the causes below?",category: 'Learning', badge_type: 'one_time', sub_text: 'Follow one cause'},
      { is_active: false, name: 'Goodie Goodie', slug: 'goodie_goodie', file_name: 'goodie_goodie.png',description_after: "You followed your first cause page on $DATE. Have you kept tabs on them through your follow page?", description_before: "Earn this badge by following one cause. Following causes let's you keep tabs on their new projects and donation drives. Why not check out one of the causes below?",category: 'Giving', badge_type: 'one_time', sub_text: 'Donate to your first cause'},
      { is_active: false, name: 'Chatty Cathy', slug: 'chatty_cathy', file_name: 'chatty_cathy.png',description_after: "You chatted up an awesome cause to your friends.", description_before: "Earn this badge by sharing causes through the social media/email links on each cause page. Letting more people know what they can do to help is awesome! Need some ideas of causes to share?",category: 'Sharing', badge_type: 'one_time', sub_text: 'Tell your friends about your new favorite cause'},
      { is_active: false, name: 'Video Viking', slug: 'video_viking', file_name: 'video_viking.png',description_after: 'You conquered that video like a true viking!', description_before: 'Need to know more about a cause before you commit? Earn this badge by kicking back and watching a video about one of these causes.',category: 'Learning', badge_type: 'one_time', sub_text: 'Kick back and check out a video'},
      { is_active: true, name: 'Getting Out There', slug: 'getting_out_there', file_name: 'getting_out_there.png',description_after: "You let $CAUSE know that you were ready to get out there and help them out.", description_before: "Got the will but not the way? Pick a cause from below and let them know that you're ready to volunteer!",category: 'Giving', badge_type: 'one_time', sub_text: 'Let a cause know you want to help them'},
      { is_active: false, name: 'Cinema Buff', slug: 'cinema_buff', file_name: 'cinema_buff.png',description_after: 'You watched 5 videos', description_before: "Become a true cinema buff by watching more cause videos. Here's a few recommendations for your playlist.",category: 'Learning', badge_type: 'Repeat_able', sub_text: 'Keep on checking out those videos'},
      { is_active: true, name: 'Enthusiast', slug: 'enthusiast', file_name: 'enthusiast.png',description_after: 'You followed at least 5 causes', description_before: "There are so many causes, and it can be hard to remember which ones you've visited...unless you're following them, that is!" ,category: 'giving', badge_type: 'repeat_able', sub_text: 'Keep tabs on more causes'},
      { is_active: true, name: 'Doler of Dollars', slug: 'doler_of_dollars', file_name: 'doler_of_dollars.png',description_after: 'You followed at least 5 causes', description_before: "Supporting causes financially allows them to support the community with goods and services.",category: 'giving', badge_type: 'repeat_able', sub_text: 'Spread your wealth around!'},
      { is_active: false, name: 'Megaphone', slug: 'megaphone', file_name: 'megaphone.png',description_after: 'You shared multiple messages', description_before: "It's time to start chatting up your favorite causes - the more people who know about causes, the more help they see. Think about sharing these causes that you've visited with your friends.",category: 'sharing', badge_type: 'repeat_able', sub_text: 'Tell your friends!'},  
      { name: 'Dirt Under Your Fingernails', slug: 'dirt_under_your_fingernails', file_name: 'dirt_under_your_fingernails.png',description_after: 'You volunteered', description_before: "Volunteering can be dirty work sometimes, but it's also really rewarding. Here are a few causes that you have followed or visited that really need a little extra person power - let them know that you can do it!",category: 'giving', badge_type: 'repeat_able', sub_text: 'Let 5 causes know how you can help them out'},
      { name: "We're Not So Far Away", slug: 'were_not_so_far_away', file_name: 'were_not_so_far_away.png',description_after: "You earned this special badge by visiting 5 global outreach causes.", description_before: "Each and every day, the world gets a little bit smaller, thanks to you and your interest in global outreach.",category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 global outreach causes'},
      { name: 'Patrons of the Arts', slug: 'patrons_of_the_arts', file_name: 'patrons_of_the_arts.png',description_after: 'You earned this special badge by visiting 5 global outreach causes.', description_before: "The sights and sounds of the artists' muse fill the air, thanks to you, fine patron of the arts.",category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 art causes'},
      { name: 'Almsgiver', slug: 'almsgiver', file_name: 'almsgiver.png',description_after: 'You earned this special badge by visiting 5 religious causes.', description_before: 'Religious organizations support their communities, and you support them by checking out their pages.',category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 religion theme pages'},  
      { name: 'Apple A Day', slug: 'apple_a_day', file_name: 'apple_a_day.png',description_after: 'Learn about 5 Health and Wellness causes.', description_before: "You're tossing apples left and right, supporting health and wellness for everybody.",category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 Health and Wellness causes'},   
      { name: 'It Takes a Village', slug: 'takes_a_village', file_name: 'takes_a_village.png',description_after: 'You earned this special badge by visiting 5 youth-centered causes.', description_before: "When it comes to supporting youth causes, you've already adopted the mentality of a member of the village.",category: 'learning', badge_type: 'theme', sub_text: 'Visit 5 youth theme pages'},
      { name: 'Lifelong Longer', slug: 'lifelong_learner', file_name: 'lifelong_learner.png',description_after: 'You earned this special badge by visiting 5 education causes.', description_before: "You're getting straight-a's today by being a lifelong learner and browsing education causes.",category: 'learning', badge_type: 'theme', sub_text: 'Learn 5 education theme pages'},  
      { name: 'Equality for All', slug: 'equality_for_all', file_name: 'equality_for_all.png',description_after: 'You earned this special badge by visiting 5 social equality causes.', description_before: "Social inequality is a hard cause to tackle, but you know there's no rest until there's equality for all.",category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 social equality causes'},  
      { name: 'Treehugger', slug: 'treehugger', file_name: 'treehugger.png',description_after: 'You earned this special badge by visiting 5 environmental cause pages.', description_before: 'The earth can breathe a bit easier, with you checking out all of these environmental causes.',category: 'learning', badge_type: 'theme', sub_text: 'Learn about 5 Environmental causes'},
      { name: 'Sample Platter', slug: 'sample_platter', file_name: 'sample_platter.png',description_after: 'You earned this special badge by visiting causes from each theme.', description_before: 'Look at you, learning a little bit about everything.',category: 'learning', badge_type: 'theme', sub_text: 'Well-rounded supporter, learning about all subjects!'},  
      { name: 'Gotta Earn Them All', slug: 'gotta_earn_them_all', file_name: 'gotta_earn_them_all.png',description_after: "You're nerdy, generous and curious - what more could anyone ask for?", description_before: "You think you've got what it takes to get all of the badges? Prove it and collect them all! Check out these individual badge pages to find out what you have to do.",category: 'none', badge_type: 'one_time', sub_text: 'Nerdy, generous and curious.'},  
      { name: 'Nerdy Supporter', slug: 'nerdy_supporter', file_name: 'nerdy_supporter.png',description_after: "Now everyone knows that you're awfully bright!", description_before: "We know you're clever,but how will anyone else know it if you don't have a nerdy supporter badge to show off?",category: 'learning', badge_type: 'one_time', sub_text: 'Get educated: Earn one of each of the other learning badges!'}, 
      { name: 'Generous Supporter', slug: 'generous_supporter', file_name: 'generous_supporter.png',description_after: "Your generosity knows no bounds and now you've got proof!", description_before: "It's time to really explore what it means to give. Check out what kinds of giving you can do with unite4 by earning these two badges.",category: 'giving', badge_type: 'one_time', sub_text: 'A variety of gifts: Earn one of each of the giving badges!'}, 
      { name: 'Curiouser and Curiouser', slug: 'curiouser_and_curiouser', file_name: 'curiouser_and_curiouser.png',description_after: 'You know how to get heard, and how to bring attention to causes that deeply matter to you.', description_before: 'You have one powerful tool for helping causes out no matter your income level or amount of time - your voice!',category: 'sharing', badge_type: 'one_time', sub_text: 'Make sure all your friends know about your causes: Earn 5 megaphone badges!'}, 
  ]

  def self.create_defaults
    DefaultBadges.each do |badge_attributes|
      badge = Badge.find_or_create_by_name(badge_attributes[:name])
      badge.update_attributes(badge_attributes)
      badge.save
    end
  end
end

# == Schema Information
#
# Table name: badges
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  file_name          :string(255)
#  accomplishment     :string(255)
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  description_after  :text
#  description_before :text
#  category           :string(255)
#  badge_type         :string(255)
#  sub_text           :string(255)
#

