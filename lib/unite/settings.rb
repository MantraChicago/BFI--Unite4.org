module Unite
  module Settings
    def self.method_missing meth, *args, &block
      return false
    end
  end
end
