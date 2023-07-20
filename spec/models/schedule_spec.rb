require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'scheduleの保存' do
    before do
      user = FactoryBot.create(:user)
      bookmark = FactoryBot.create(:bookmark, user: user)
      @schedule = FactoryBot.build(:schedule, bookmark: bookmark)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@schedule).to be_valid
      end
      it 'dayは空でも保存できる' do
        @schedule.day = ''
        expect(@schedule).to be_valid
      end
      it 'timeは空でも保存できる' do
        @schedule.time = ''
        expect(@schedule).to be_valid
      end
      it 'locationは空でも保存できる' do
        @schedule.location = ''
        expect(@schedule).to be_valid
      end
      it 'descriptionは空でも保存できる' do
        @schedule.description = ''
        expect(@schedule).to be_valid
      end
    end
  end
end
