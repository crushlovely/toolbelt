module Toolbelt
  module RenderUtilities
    extend ActiveSupport::Concern

    private

    def helpers
      ApplicationController.helpers
    end
    alias_method :h, :helpers

    def routes
      Rails.application.routes.url_helpers
    end
    alias_method :r, :routes

    def handle_none(*args)
      if args.to_a.all?(&:present?)
        yield
      else
        nil
      end
    end
  end
end
