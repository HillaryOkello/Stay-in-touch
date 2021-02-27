require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'creates a comment correctly' do
    user = User.new(name: 'Hillary', email: 'hillary@x.com', password: '123456')
    post = Post.create(content: 'Hello!', user: user)
    comment = Comment.create(user: user, post: post, content: 'Awesome post')
    expect(comment.valid?).to be true
  end

  it 'comment must have content' do
    user = User.new(name: 'Hillary', email: 'hillary@x.com', password: '123456')
    post = Post.create(content: 'Hey!', user: user)
    comment = Comment.create(user: user, post: post)
    expect(comment.valid?).to be false
  end
end
