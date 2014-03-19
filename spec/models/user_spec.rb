require 'spec_helper'

describe User do 

  it 'is valid with an email, password & password_confirmation' do 
    user = User.new(
      email: 'surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    expect(user).to be_valid
  end

end