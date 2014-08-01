require 'toolbelt/version'
require 'hashie'

module Toolbelt
  class ToolbeltError < StandardError
  end

  class OverrideInSubclassError < ToolbeltError
  end
end
