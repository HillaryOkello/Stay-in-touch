require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'creates user correctly' do
    @user = User.new(name: 'Hillary', email: 'hillary@x.com', password: '123456')
    expect(@user.valid?).to be true
  end

  it 'user must have password' do
    @user = User.new(name: 'Kelly', password: '123456')
    expect(@user.valid?).to be false
  end

  it 'user must have email' do
    @user = User.new(name: 'Hillary', email: 'hillary@x.com')
    expect(@user.valid?).to be false
  end
end
