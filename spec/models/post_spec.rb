require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    let(:post) { create(:post) }

    it 'should be valid' do
      expect(post).to be_valid
    end

    it 'should create post with name Facebook' do
      post = create(:post, title: 'Facebook')
      expect(post.title).to eq 'Facebook'
    end

    it 'should not be valid without title' do
      post = build(:post, title: nil)
      expect(post).not_to be_valid
    end
  end

  describe 'Association' do
    it 'should have many comments' do
      posts = Post.reflect_on_association(:comments)
      expect(posts.macro).to eq :has_many
    end
  end

  describe 'Comments' do
    let(:post) { create(:post_with_comments) }
    it 'should have at least one post' do
      expect(post.comments.count).to eq 1
    end
  end

  describe '#join_comments' do
    let(:post) { create(:post) }
    it 'should return comment join by new line' do
      create(:comment, post: post, comment: 'Hello')
      create(:comment, post: post, comment: 'Milind')
      expect(post.join_comments).to eq 'Hello\nMilind'
    end
  end
end
