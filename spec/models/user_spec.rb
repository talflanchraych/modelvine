require 'spec_helper'

describe User do 

  it 'is valid with an email, password & password_confirmation' do 
    user = User.new(
      email: 'surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    expect(user).to be_valid
  end

  it 'must have a unique email, case sentive false' do 
    User.create(
      email: 'surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    user1 = User.new(
      email: 'Surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    expect(user1).to have(1).errors_on(:email)
  end

  it 'requires an access code to be created' do 
    pending "Is this going to occur on creation or update?"
    pending "I think we are only validating this in the view, w/ tooltips"
  end

  it 'can be updated with a username, name, zip_code' do 
    User.create(
      email: 'surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    user = User.find_by(email: 'surgentt@gmail.com')
    user.update(
      name: 'Thomas Surgent',
      zip_code: "10009",
      username: "surgentt",)
    expect(user).to be_valid
  end

  it 'must have a unique username on update' do 
    User.create(
      email: 'surgentt@gmail.com',
      username: 'surgentt',
      password: '123password',
      password_confirmation: '123password')
    user1 = User.create(
      email: 'surgenttuniq@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    user1 = User.find_by(email: 'surgenttuniq@gmail.com')
    user1.update(
      username: 'surgentt',
      name: 'bob surgent',
      zip_code: '10009')
    expect(user1).to have(1).errors_on(:username)
  end

end
