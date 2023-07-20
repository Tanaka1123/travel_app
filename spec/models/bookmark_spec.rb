require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'bookmarkの保存' do
    before do
      user = FactoryBot.create(:user)
      @bookmark = FactoryBot.build(:bookmark, user_id: user.id)
    end

    context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@bookmark).to be_valid
    end
    it 'destinationは空でも保存できる' do
      @bookmark.destination = ''
      expect(@bookmark).to be_valid
    end
    it 'departure_dateは空でも保存できる' do
      @bookmark.departure_date = ''
      expect(@bookmark).to be_valid
    end
    it 'return_dateは空でも保存できる' do
      @bookmark.return_date = ''
      expect(@bookmark).to be_valid
    end
    it 'membersは空でも保存できる' do
      @bookmark.members = ''
      expect(@bookmark).to be_valid
    end
    it 'nameは空でも保存できる' do
      @bookmark.name = ''
      expect(@bookmark).to be_valid
    end
  end
end
end