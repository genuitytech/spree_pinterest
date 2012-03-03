require "spec_helper"

module Spree
  describe PinterestHelper do
    describe "pin_it_button output" do
      let(:product) { Factory(:product) }
      let(:output) { helper.pin_it_button(product) }

      context "when the product contains no images" do
        subject { output }
        it { should be_nil }
      end

      context "when the product does contain images" do
        let(:url) { "http://mystore.com/image1.gif" }

        before do
          product.images << Factory.build(:image)
          product.save!
        end

        describe "href" do
          context "when image attachment url is a relative url" do
            before do
              product.images.first.stub_chain(:attachment, :url).and_return("/path/to/image.png")
            end

            let(:expected_output) do
              image = product.images.first
              "http://pinterest.com/pin/create/button/?url=#{escape(spree.product_url(product, :host => "test.host"))}&media=#{escape("http://test.host#{image.attachment.url}")}&description=#{escape(product.name)}"
            end

            subject { Nokogiri::HTML(output).xpath("//a/@href").text }

            it { should == expected_output }
          end

          context "when image attachment url is an absolute url" do
            before do
              product.images.first.stub_chain(:attachment, :url).and_return("http://test.host/path/to/image.png")
            end

            let(:expected_output) do
              image = product.images.first
              "http://pinterest.com/pin/create/button/?url=#{escape(spree.product_url(product, :host => "test.host"))}&media=#{escape("http://test.host#{image.attachment.url}")}&description=#{escape(product.name)}"
            end

            subject { Nokogiri::HTML(output).xpath("//a/@href").text }

            it { should == expected_output }
          end

          def escape(string)
            URI.escape string, /[^#{URI::PATTERN::UNRESERVED}]/
          end

          def spree
            Spree::Core::Engine.routes.url_helpers
          end
        end

        describe "class" do
          subject { Nokogiri::HTML(output).xpath("//a/@class").text }

          it { should == "pin-it-button" }
        end

        describe "class" do
          subject { Nokogiri::HTML(output).xpath("//a/@count-layout").text }

          it { should == "horizontal" }
        end

        it "is html safe" do
          link_output = double(:link_output)
          link_output.should_receive(:html_safe)
          helper.stub(:link_to).and_return(link_output)

          helper.pin_it_button product
        end
      end
    end
  end
end
