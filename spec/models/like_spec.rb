require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'creates a like correctly' do
    user = User.new(name: 'Hillary', email: 'hillary@x.com', password: '123456')
    post = Post.create(content: 'Hello!', user: user)
    like = Like.create(user: user, post: post)
    expect(like.valid?).to be true
  end
end
