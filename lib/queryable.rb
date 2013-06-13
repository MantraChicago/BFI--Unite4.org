module Queryable
  extend ActiveSupport::Concern

  module ClassMethods
    def query(params={})
      scoped = {}
    end
  end
end