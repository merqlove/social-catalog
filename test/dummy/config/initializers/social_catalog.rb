SocialCatalog.author = 'Am'
SocialCatalog.title = 'Test'
SocialCatalog.description = 'Test'
SocialCatalog.url_prefix = 'social-test-catalog'
SocialCatalog.expires_in = 1.hour
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
