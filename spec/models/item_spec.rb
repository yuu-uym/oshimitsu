require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの登録' do
    context 'アイテム登録がうまくいくとき' do
      it 'name,priceが存在し、quantity_idが１以上、category_id, status_idが２以上であれば登録できる' do
        expect(@item).to be_valid
      end
      it 'name,priceが存在し、quantity_idが１以上、category_idが２以上、status_idが2のときにpurchase_dateがあれば登録できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'category_idが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'status_id が１だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("ステータスは1以外の値にしてください")
      end
      it 'price が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'price が全角だと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'quantity_idが空だと登録できない' do
        @item.quantity_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("個数を入力してください")
      end
      it 'quantity_id が0だと登録できない' do
        @item.quantity_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("個数は0より大きい値にしてください")
      end
      it 'quantity_idが1000以上だと登録できない' do
        @item.quantity_id = 1000
        @item.valid?
        expect(@item.errors.full_messages).to include("個数は1000より小さい値にしてください")
      end
      it 'quantity_idが全角だと登録できない' do
        @item.quantity_id = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("個数は数値で入力してください")
      end
      it 'status_idが2のときにpurchase_dateがなければ登録できない' do
        @item.status_id = 2
        @item.purchase_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("購入日を入力してください")
      end
    end
  end
end


