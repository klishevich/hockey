# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    client nil
    event_type "MyString"
    event_description "MyText"
  end
end
