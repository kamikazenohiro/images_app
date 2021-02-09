require 'rails_helper'
RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe '画像投稿' do
    context '画像投稿がうまくいくとき' do
      it '画像が存在すれば投稿できる' do
        expect(@message).to be_valid
      end
      it '文字を入力しなくても投稿できる' do
        expect(@message).to be_valid
        @message.content = nil
      end
    end

    context '画像投稿がうまくいかないとき' do
      it '画像が必須であること' do
        @message.images = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Images can't be blank")
      end
    end
  end
end
