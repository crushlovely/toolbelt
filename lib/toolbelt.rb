require 'toolbelt/version'
require 'hashie'

require 'toolbelt/service'
require 'toolbelt/policy'

module Toolbelt
  class ToolbeltError < StandardError
  end

  class OverrideInSubclassError < ToolbeltError
  end
end
