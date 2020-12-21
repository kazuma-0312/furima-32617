require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context "出品成功時" do
      it "nameとtextとcategory,delivery,status,city,days,priceがあればOK" do
        expect(@item).to be_valid
      end
      it "category_idが1以外ならOK" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "delivery_idが1以外ならOK" do
        @item.delivery_id = 2
        expect(@item).to be_valid
      end
      it "status_idが1以外ならOK" do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it "city_idが1以外ならOK" do
        @item.city_id = 2
        expect(@item).to be_valid
      end
      it "days_idが1以外ならOK" do
        @item.days_id = 2
        expect(@item).to be_valid
      end
      it "価格が半角ならOK" do
        @item.price = 60_000
        expect(@item).to be_valid
      end
      it "価格が300~9999999の間ならOK" do
        @item.price = 60_000
      end
    end

    context "出品できない時" do
      it "imageが空のとき出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空のとき出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空のとき出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空のとき出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "delivery_idが空のとき出品できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
      it "status_idが空のとき出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "city_idが空のとき出品できない" do
        @item.city_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("City must be other than 1")
      end
      it "days_idが空のとき出品できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it "価格が空なら出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が半角以外なら出品できない" do
        @item.price = "１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "価格が300~99,999,999を超えているなら出品できない" do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end  
      it "価格が300以下なら出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
    end
  end
end
