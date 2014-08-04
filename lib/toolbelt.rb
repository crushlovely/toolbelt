require 'toolbelt/version'
require 'hashie'

require 'toolbelt/service'

module Toolbelt
  class ToolbeltError < StandardError
  end

  class OverrideInSubclassError < ToolbeltError
  end
end
