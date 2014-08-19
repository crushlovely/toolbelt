module Toolbelt
  module Util
    module OptionValidator
      def validate_options!(options)
        validator = HashValidator.validate(options, required_options)
        fail Toolbelt::RequiredOptionsError, validator.errors unless validator.valid?
      end

      def required_options
        {}
      end
    end
  end
end
