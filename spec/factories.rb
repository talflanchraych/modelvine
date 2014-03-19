FactoryGirl.define do
  factory :user do
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end