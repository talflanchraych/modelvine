require 'spec_helper'

describe Model do 

  it 'create a valid model' do 
    model = Model.create
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    user_model = User.create(
      email: "test@gmail.com",
      password: "foobar1234",
      password_confirmation: "foobar1234",
      code_used: gen_code,
      name: "thomas surgent",
      zip_code: "10009",
      username: "testuser",
      user_type_type: "model",
      user_type_id: model.id,)
    expect(user_model).to be_valid
  end

  it 'does not allow a model to be updated without a picture or a birthdate' do 
    model = Model.create
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    user_model = User.create(
      email: "test@gmail.com",
      password: "foobar1234",
      password_confirmation: "foobar1234",
      code_used: gen_code)
    user_model.update(
      name: "thomas surgent",
      zip_code: "10009",
      username: "testuser",
      user_type_type: "model",
      user_type_id: model.id)
    #binding.pry
    model.update(
      gender: "male", 
      height: "female", 
      ethnicity: "caucasion",
      eye_color: "blue", 
      hair_color: "blond")
    expect(model).to have(2).error
  end


end