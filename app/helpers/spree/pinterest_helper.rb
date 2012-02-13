module Spree
  module PinterestHelper
    def pin_it_button(product)
      return if product.images.blank?

      url = escape request.url
      media = escape product.images.first.attachment.url
      description = escape product.name

      link_to("Pin It",
              "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}",
              :class => "pin-it-button",
              "count-layout" => "horizontal").html_safe
    end

    private

    def escape(string)
      URI.escape string, /[^#{URI::PATTERN::UNRESERVED}]/
    end
  end
end
