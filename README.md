# SocialCatalog
Library to render xml & other formats especially for FB and others.

The project at the initial state, any great contribution are welcome.

## Usage

### Add to initializers folder social_catalog.rb

[Facebook example](https://developers.facebook.com/docs/marketing-api/catalog/reference/#product-categories)

```ruby
SocialCatalog.author = 'Am'
SocialCatalog.title = 'Test'
SocialCatalog.description = 'Test'
SocialCatalog.url_prefix = 'social-test-catalog'
SocialCatalog.expires_in = 1.hours
SocialCatalog.base_url = 'http://localhost:3000'

SocialCatalog.facebook_items = lambda { |xml, prefix|
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
      xml[prefix].title d[:title]
      xml[prefix].description d[:title]
      xml[prefix].link d[:link]
      xml[prefix].image_link d[:link]
      xml[prefix].brand d[:link]
      xml[prefix].google_product_category 'Apparel & Accessories > Clothing > Outerwear > Coats & Jackets'
      xml[prefix].condition 'New'
      xml[prefix].availability 'in stock'
      xml[prefix].price '100000.99 RUB'
      xml[prefix].sale_price '10000.99 RUB'
      xml.additional_image_link d[:link]
      xml.color 'Red'
      xml.gender 'male'
      xml.size '15'
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
