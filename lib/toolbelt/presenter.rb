module Toolbelt
  class Presenter
    extend ActiveModel::Naming
    include RenderUtilities

    attr_reader :template, :object
    alias_method :t, :template

    delegate :to_param, :to_key, :to => :object

    def self.all(collection, template)
      collection.collect { |c| new(c, template) }
    end

    def self.presents(name)
      define_method(name) do
        @object
      end
    end

    def initialize(object, template)
      @object = object
      @template = template
    end
  end
end
