# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    latitude 1.5
    longitude 1.5
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/fixtures/test.jpg'))) }
    comment "MyText"
    device_id "device"
    #state "MyString"
  end
end
