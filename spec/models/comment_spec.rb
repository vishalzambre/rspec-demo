require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validate Post' do
    let(:comment) { build(:comment, post_id: nil) }
    it 'should not comment without post' do
      expect(comment).not_to be_valid
    end
  end
end
