module Toolbelt
  class Service
    include Util::OptionValidator

    attr_reader :options

    def self.call(options = {})
      new(options).call
    end

    def initialize(options = {})
      validate_options!(options)
      @options = Hashie::Mash.new(options)
    end

    def call
      fail Toolbelt::OverrideInSubclassError
    end
  end
end
