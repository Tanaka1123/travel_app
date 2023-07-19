require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'bookmarkの保存' do
    it 'すべての値が正しく入力されていれば保存できること' do
      user = FactoryBot.create(:user)
      bookmark = FactoryBot.build(:bookmark, user: user)
      expect(bookmark).to be_valid
    end
  end
end