require 'spec_helper'

describe User do 

  it 'has a valid factory / Email, Password, Acces Code Works' do 
    expect(build(:user)).to be_valid
  end

  it 'requires a valid access code to be created' do 
    user = build(:user, code_used: "invalid_access_code")
    expect(user).to have(1).errors_on(:code_used)
  end

  it 'access code can\'t be used twice' do 
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    create(:user, code_used: gen_code)
    code_used = AccessCode.find_by(code: gen_code)
    expect(code_used.used).to eq(true) 

    user1 = User.create(
      email: 'surgenttuniq@gmail.com',
      password: '123password',
      password_confirmation: '123password',
      code_used: gen_code)   
    expect(user1).to have(1).errors_on(:code_used) 
  end

  it 'marks the access code as used after sign up' do
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)
    create(:user, code_used: gen_code)
    code_used = AccessCode.find_by(code: gen_code)
    expect(code_used.used).to eq(true) 
  end

  it 'it allows one user to give another user a code and the id to be set' do 
    user = create(:user)
    given_code = user.access_codes.first
    user1 = User.create(
      email: 'surgentasdftuniq@gmail.com',
      username: 'somethingdnew',
      password: '123password',
      password_confirmation: '123password',
      code_used: given_code.code,
      username: 'surgendastt',
      name: 'bob surgent',
      zip_code: '10009')
    expect(given_code.used_by).to eq(user1.id)
  end

  it 'must have a unique email, case sentive false' do 
    create(:user)
    user1 = User.new(
      email: 'Surgentt@gmail.com',)
    expect(user1).to have(1).errors_on(:email)
  end

  it "generates 10 invite code on signup" do 
    user = create(:user)
    expect(user.access_codes.count).to eq(10)
  end

  # User Update

  it 'can be updated with a username, name, zip_code' do 
    gen_code = 'abcafdsew'
    AccessCode.create(:code => gen_code)
    create(:user, code_used: gen_code)
    user = User.find_by(email: 'surgentt@gmail.com')
    user.update(
      name: 'Thomas Surgent',
      zip_code: "10009",
      username: "surgentt",)
    expect(user).to be_valid
  end

  it 'must have a unique username on update' do 
    gen_code = SecureRandom.hex
    AccessCode.create(:code => gen_code)

    user = create(:user, username: 'surgentt')
    user1 = User.create(
      email: 'surgenttuniq@gmail.com',
      password: '123password',
      password_confirmation: '123password',
      code_used: gen_code)
    user1 = User.find_by(email: 'surgenttuniq@gmail.com')
    user1.update(
      username: 'surgentt',
      name: 'bob surgent',
      zip_code: '10009')
    expect(user1).to have(1).errors_on(:username)
  end

  it "username cannot have any spaces" do
    user = create(:user, username: 'surgent t')
    expect(user).to have(1).errors_on(:username)
  end

end
