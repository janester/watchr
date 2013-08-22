# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :following do
    user_id 1
    movie_id 1
    is_watched false
  end
end
