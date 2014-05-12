# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    latitude 1.5
    longitude 1.5
    image "MyString"
    comment "MyText"
    device_id "MyString"
    state "MyString"
  end
end
