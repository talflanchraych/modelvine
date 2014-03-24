require 'spec_helper'

describe Model do 

  it 'will not create a user' do 
    model = Model.new(
      email: 'surgentt@gmail.com',
      password: '123password',
      password_confirmation: '123password')
    expect(user).to be_valid
  end

end