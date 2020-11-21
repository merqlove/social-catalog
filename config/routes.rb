SocialCatalog::Engine.routes.draw do
  get 'facebook', to: 'facebook#index', format: :xml, as: :social_catalog_facebook
end
