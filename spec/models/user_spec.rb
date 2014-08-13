require 'rails_helper'

RSpec.describe User, type: :model do
  it 'responds to attributes username, password, calorie_cuttoff' do
    user = User.new

    expect(user).to respond_to(:username)
    expect(user).to respond_to(:password)
    expect(user).to respond_to(:calorie_cuttoff)
  end

  it 'has valid factories' do
    user = build :user
    expect(user).to be_valid
    expect(user.save).to be_truthy
  end

  it 'has password_hash and password_salt' do
    user = create :user

    expect(user.password_hash).not_to be_nil
    expect(user.password_salt).not_to be_nil
  end

  it 'authenticates user with right password' do
    user = create :user, username: 'foo@bar.com', password: 'password'

    expect(User.authenticate('foo@bar.com', 'password')).to eql(user)
  end

  it 'doesnt authenticate user with wrong password' do
    user = create :user, username: 'foo@bar.com', password: 'password'

    expect(User.authenticate('foo@bar.com', 'wrongpasswors')).to be_nil
  end
end
