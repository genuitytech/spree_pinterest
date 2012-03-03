FactoryGirl.define do
  factory :image, :class => 'Spree::Image' do
    attachment File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/lambo.jpg'))
  end
end
