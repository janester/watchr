# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    content "MyText"
    votes 1
    kind "MyString"
    party_id "MyString"
  end
end
