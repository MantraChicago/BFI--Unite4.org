module Unite
  module Events
    # This is a basic rack endpoint that allows us to track
    # the events a user of the site performs while on the site
    class TrackingEndpoint
      attr_accessor :app, :options

      def initialize(app=nil, options={})
        @app = app
        @options = options.dup
      end

      def call(env)
        request= Rack::Request.new(env)
        variables=request.params
        if variables['name'] && variables['user_id']
          variables['url']=request.path
          Unite::Events::Tracker.track_event(variables['name'],variables['user_id'],variables)
          [200, {"Content-Type" => "text/html"}, ["Event logged"]]
        else
          [500, {"Content-Type" => "text/html"}, ["A name and user_id must be set"]]
        end
        
      end
    end
  end
end



