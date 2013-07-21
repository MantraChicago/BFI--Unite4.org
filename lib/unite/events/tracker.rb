module Unite
  module Events
    module Tracker
      class Logger < ::Logger
        def format_message(severity, timestamp, progname, msg)
          "#{ timestamp.to_i }\t#{msg}\n"
        end
      end

      def self.basic
        logfile = File.open("#{ Rails.root }/log/#{ Rails.env }event-tracker.log", "a")
        logfile.sync = true

        @logger ||= Unite::Events::Tracker::Logger.new(logfile)
      end

      def self.capture_event event_name, attributes={}
        basic.info "#{ event_name }"
      end
    end
  end
end
