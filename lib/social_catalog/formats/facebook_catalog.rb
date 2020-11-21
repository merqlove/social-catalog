require 'nokogiri'

module SocialCatalog
  module Formats
    # Facebook RSS Feed
    class FacebookCatalog
      def initialize
        super
      end

      # @param [Proc] block
      # @return [String]
      def call(&block)
        Rails.cache.fetch('social-catalog:facebook',
                          expires_in: SocialCatalog.expires_in) do
          full_host = SocialCatalog.base_url

          builder = Nokogiri::XML::Builder.new do |xml|
            xml.rss('xmlns:g' => 'http://base.google.com/ns/1.0',
                    'version' => '2.0') do
              xml.channel do
                xml.title       SocialCatalog.title
                xml.description SocialCatalog.description
                xml.link        rel: 'self', href: "#{full_host}/#{SocialCatalog.url_prefix}/facebook.xml"
                xml.id          "#{full_host}/"

                block.call(xml)
              end
            end
          end

          builder.to_xml
        end
      end
    end
  end
end
