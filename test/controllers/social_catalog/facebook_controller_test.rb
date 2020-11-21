require 'test_helper'

module SocialCatalog
  class FacebookControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should get index' do
      get social_catalog_facebook_url
      assert_response :success
    end

    test 'should get index twice faster' do
      get social_catalog_facebook_url
      assert_response :success
    end

  end
end
