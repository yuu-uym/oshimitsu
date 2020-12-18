require 'rails_helper'
describe Genre do
  before do
    @genre = FactoryBot.build(:genre)
    @genre.image = fixture_file_upload('/files/test.jpeg')
  end

  describe 'ジャンルの登録' do
    context 'ジャンルの登録がうまくいくとき' do
      it 'image、theme、set_amountが存在すれば登録できる' do
        expect(@genre).to be_valid
      end
    end

    context 'ジャンルの登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @genre.image = nil
        @genre.valid?
        expect(@genre.errors.full_messages).to include("アイコン画像を入力してください")
      end
      it 'themeが空だと登録できない' do
        @genre.theme = ''
        @genre.valid?
        expect(@genre.errors.full_messages).to include("ジャンルのテーマを入力してください")
      end
      it 'set_amountが空だと登録できない' do
        @genre.set_amount = ''
        @genre.valid?
        expect(@genre.errors.full_messages).to include("月額上限を入力してください")
      end
      it 'set_amount が全角だと登録できない' do
        @genre.set_amount = '５００'
        @genre.valid?
        expect(@genre.errors.full_messages).to include("月額上限は数値で入力してください")
      end
    end
  end
end

