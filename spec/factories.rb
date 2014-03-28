FactoryGirl.define do
  factory :user do
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    email    "surgentt@gmail.com"
    password "foobar1234"
    password_confirmation "foobar1234"
    code_used gen_code
  end

  # factory :user_model do
  #   model = Model.create
  #   gen_code = SecureRandom.hex
  #   AccessCode.create(:code => gen_code)
  #   email    "test@gmail.com"
  #   password "foobar1234"
  #   password_confirmation "foobar1234"
  #   code_used gen_code
  #   zip_code "10009"
  #   username "testuser"
  #   user_type_type "model"
  #   user_type_id model.id
  # end

end