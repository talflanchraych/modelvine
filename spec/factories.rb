FactoryGirl.define do
  factory :user do
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    email    "surgentt@gmail.com"
    password "foobar1234"
    password_confirmation "foobar1234"
    code_used gen_code
  end

end