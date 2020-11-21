SocialCatalog.author = 'Am'
SocialCatalog.title = 'Test'
SocialCatalog.description = 'Test'
SocialCatalog.url_prefix = 'social-test-catalog'
SocialCatalog.expires_in = 1.hour
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
