# SocialCatalog
Library to render xml & other formats especially for FB and others.

The project at the initial state, any great contribution are welcome.

## Usage

### Add to initializers folder social_catalog.rb

```ruby
SocialCatalog.author = 'Am'
SocialCatalog.title = 'Test'
SocialCatalog.description = 'Test'
SocialCatalog.url_prefix = 'social-test-catalog'
SocialCatalog.expires_in = 1.hours
SocialCatalog.base_url = 'http://localhost:3000'

SocialCatalog.facebook_items = lambda { |xml|
  data = [
    { title: 'Test1',
      link: SocialCatalog.base_url + '/items/some1',
      some_field: 'field1',
      updated: Time.now.to_s },
    { title: 'Test2',
      link: SocialCatalog.base_url + '/items/some2',
      some_field: 'field2',
      updated: Time.now.to_s },
    { title: 'Test3',
      link: SocialCatalog.base_url + '/items/some3',
      some_field: 'field3',
      updated: Time.now.to_s },
    { title: 'Test4',
      link: SocialCatalog.base_url + '/items/some4',
      some_field: 'field4',
      updated: Time.now.to_s }
  ]
  data.each do |d|
    xml.item do
      xml.title d[:title]
      xml.description d[:title]
      xml.link d[:link]
      xml.image_link d[:link]
      xml.brand d[:link]
      xml.condition 'new'
      xml.availability 'in stock'
      xml.price '100000.99 RUB'
      xml.shipping do
        xml.country 'Russia'
        xml.service 'Standard'
        xml.price '1000 RUB'
      end
    end
  end
}
```

### Add to routes

```ruby
mount SocialCatalog::Engine, at: "/social-test-catalog"
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'social_catalog'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install social_catalog
```

## Contributing
1. Fork it ( https://github.com/merqlove/do_snapshot/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
