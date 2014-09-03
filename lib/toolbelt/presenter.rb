module Toolbelt
  class Presenter
    include Util::OptionValidator

    attr_reader :options

    def self.all(collection)
      collection.collect { |c| new(c) }
    end

    def self.present(options = {})
      new(options).present
    end

    def initialize(options = {})
      validate_options!(options)
      @options = Hashie::Mash.new(options)
    end

    def present
      fail Toolbelt::OverrideInSubclassError
    end
  end

  private

  def self.presents(name)
    define_method(name) do
      options.object
    end
  end
end
