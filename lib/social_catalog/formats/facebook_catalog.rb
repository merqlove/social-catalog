# frozen_string_literal: true
require 'nokogiri'

module SocialCatalog
  module Formats
    # Facebook RSS Feed
    # https://developers.facebook.com/docs/marketing-api/catalog/reference/#product-categories
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
                    'xmlns:atom' => 'http://www.w3.org/2005/Atom',
                    'version' => '2.0') do
              xml.channel do
                xml.title       SocialCatalog.title
                xml.description SocialCatalog.description
                xml.link        SocialCatalog.base_url
                xml['atom'].link rel: 'self',
                                 href: "#{full_host}/#{SocialCatalog.url_prefix}/facebook.xml",
                                 type: 'application/rss+xml'

                block.call(xml, 'g')
              end
            end
          end

          builder.to_xml
        end
      end
    end
  end
end
