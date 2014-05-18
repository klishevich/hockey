# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    type ""
    inn "MyString"
    kpp "MyString"
    ogrn "MyString"
    fullname "MyText"
    shortname "MyString"
    index 1
    country "MyString"
    city "MyText"
    address "MyText"
  end
end
