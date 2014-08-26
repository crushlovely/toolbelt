module Toolbelt
  class Policy
    include Util::OptionValidator

    attr_reader :options

    def self.pass?(options = {})
      new(options).pass?
    end

    def self.fail?(options = {})
      new(options).fail?
    end

    def initialize(options = {})
      validate_options!(options)
      @options = Hashie::Mash.new(options)
    end

    def pass?
      fail Toolbelt::OverrideInSubclassError
    end

    def fail?
      !pass?
    end
  end
end
