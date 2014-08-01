module Toolbelt
  class Service
    attr_reader :options

    def self.call(options = {})
      new(options).call
    end

    def initialize(options = {})
      @options = Hashie::Mash.new(options)
    end

    def call
      raise Toolbelt::OverrideInSubclassError
    end
  end
end