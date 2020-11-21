require 'social_catalog/engine'

#
# Social catalog
#
module SocialCatalog
  mattr_accessor :url_prefix, default: 'social-catalog'
  mattr_accessor :author
  mattr_accessor :title
  mattr_accessor :description
  mattr_accessor :expires_in, default: 12.hours
  mattr_accessor :base_url
  mattr_accessor :facebook_items, default: proc {}
end
