module Unite
  module Events
    module Tracker
      def self.track_event(name, user_id,variables={})
        variables[:name]=name
        variables[:user_id]=user_id
        user_event=UserEvent.new(variables)
        user_event.save
      end

    end
  end
end
