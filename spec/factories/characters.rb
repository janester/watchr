# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name "MyString"
    movie_id 1
    actor_id 1
  end
end
