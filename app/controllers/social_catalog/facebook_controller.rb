require_dependency 'social_catalog/application_controller'

module SocialCatalog
  # Facebook controller output
  class FacebookController < ::SocialCatalog::ApplicationController
    def index
      result = catalog.call(&SocialCatalog.facebook_items)
      render xml: result, status: 200
    end

    private

    def catalog
      @catalog ||= Formats::FacebookCatalog.new
    end
  end
end
