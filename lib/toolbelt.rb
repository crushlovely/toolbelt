require 'toolbelt/version'
require 'hashie'
require 'hash_validator'

require 'toolbelt/util/option_validator'
require 'toolbelt/service'
require 'toolbelt/policy'
require 'toolbelt/presenter'

module Toolbelt
  class ToolbeltError < StandardError
  end

  class OverrideInSubclassError < ToolbeltError
  end

  class RequiredOptionsError < ToolbeltError
    # Internal
    def initialize(errors)
      super("Missing required options '#{errors.inspect}'")
    end
  end
end
