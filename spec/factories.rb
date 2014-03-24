FactoryGirl.define do
  factory :user do
    email    "thomas@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end