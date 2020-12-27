require 'rails_helper'

RSpec.describe HomeBuy, type: :model do
  describe '商品購入' do
    before do
      @home_buy = FactoryBot.build(:home_buy)
    end
    context "商品が購入できる時" do
      it "address, city_id, number, municipality, streetがあれば購入OK" do
        expect(@home_buy).to be_valid
      end
      it "buildingが空でも購入OK" do
        @home_buy.building = nil
        expect(@home_buy).to be_valid
      end
    end

    context "商品が購入できない時" do
      it "addressが空だと購入できない" do
        @home_buy.address = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Address can't be blank")
      end
      it "addressにハイフンがないと購入できない" do
        @home_buy.address = 1111111
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Address code Input correctly")
      end
      it "city_idが1だと購入できない" do
        @home_buy.city_id = 1
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("City Select")
      end
      it "municipalityが空だと購入できない" do
        @home_buy.municipality = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Municipality can't be blank")
      end
      it "streetが空だと購入できない" do
        @home_buy.street = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Street can't be blank")
      end
      it "numberが空だと購入できない" do
        @home_buy.number = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Number can't be blank")
      end
      it "numberに文字が入っていると購入できない" do
        @home_buy.number = 'あ1111111111'
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Number Input only number")
      end
      it "numberが12文字なら購入できない" do
        @home_buy.number = '111111111111'
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Number Input only number")
      end
      it "user_idが空だと購入できない" do
        @home_buy.user_id = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと購入できない" do
        @home_buy.item_id = nil
        @home_buy.valid?
        expect(@home_buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end