# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    year "MyString"
    runtime 1
    poster "MyString"
    synopsis "MyText"
    a_score 1
    c_score 1
  end
end
