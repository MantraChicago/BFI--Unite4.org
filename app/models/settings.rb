require 'singleton'

class Settings

  include Singleton

  def self.method_missing(method_name, *args, &block)
    if instance.respond_to?(method_name)
      instance.send(method_name, *args, &block)
    else
      super
    end
  end

  def self.respond_to_missing?(method_name, include_private=false)
    instance.respond_to?(method_name, include_private)
  end


  # Helpers

  def production?
    Rails.env.production? || Rails.env.staging?
  end


  # CarrierWave

  def carrierwave_storage
    production? ? :fog : :file
  end


private

  RequiredValue = Class.new(StandardError)

  module Requirements
    def fetch_with_default(key, default=nil)
      fetch(key, default)
    end

    def require(key)
      fetch(key) { raise RequiredValue.new("Missing settings: #{key}") }
    end

    def require_in_production(key)
      fetch(key) {
        unless Rails.env.development? || Rails.env.test?
          raise RequiredValue.new("Missing settings: #{key}")
        end
      }
    end
  end

  def env
    ENV.clone.extend(Requirements)
  end

end
