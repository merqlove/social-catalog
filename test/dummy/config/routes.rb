Rails.application.routes.draw do
  mount SocialCatalog::Engine, at: "/social-catalog"
end
