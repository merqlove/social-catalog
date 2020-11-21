$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'social_catalog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'social_catalog'
  spec.version     = SocialCatalog::VERSION
  spec.authors     = ['Alexander Merkulov']
  spec.email       = ['sasha@merqlove.ru']
  spec.homepage    = 'https://github.com/merqlove/social-catalog'
  spec.summary     = 'Tools to generate usable social catalog RSS.'
  spec.description = 'Tools to generate usable social catalog RSS.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.2.2'
  spec.add_dependency 'nokogiri', '>= 1.8.5'
end
