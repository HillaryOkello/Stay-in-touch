require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { User.new(name: 'Hillary', email: 'hillary@x.com', password: 'abcd') }
  let(:friend) { User.new(name: 'Kelly', email: 'kelly@y.com', password: 'abcd') }
  let(:friendship) { Friendship.create(user: user, friend: friend) }

  it 'creates a friendship correctly' do
    expect(friendship.valid?).to be true
  end

  it 'friendship default status should be false' do
    expect(friendship.confirmed).to be nil
  end

  it 'can create a friendship through user' do
    new_friendship = user.friendships.build(friend: friend)
    expect(new_friendship.valid?).to be true
  end
end
