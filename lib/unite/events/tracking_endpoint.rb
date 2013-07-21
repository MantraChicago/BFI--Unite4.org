module Unite
  module Events
    # This is a basic rack endpoint that allows us to track
    # the events a user of the site performs while on the site
    class TrackingEndpoint
      attr_accessor :app, :options

      def initialize(app, options={})
        @app = app
        @options = options.dup
      end

      def call(env)
        # TODO
        # Figure an elegant way of parsing event params from the request
        # or rather, a structure for the request params that would fit in
        # all situations
        Unite::Events::Tracker.track_event("event_name", {})
        [200,{},[""]]
      end
    end
  end
end



