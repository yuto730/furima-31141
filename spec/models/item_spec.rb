require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品がうまくいくとき' do
      it "imageとname、descriptionとcategory_id、status_idとshipping_id、prefecture_idとday_id、priceとuser_idが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上だと出品できない" do
        @item.name = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "descriptionが空だと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "descriptionが1000文字以上だと出品できない" do
        @item.description = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空だと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_idが空だと出品できない" do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_idが空だと出品できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
      end
      it "priceが299円以下では出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceが10,000,000円以上では出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceが半角数字以外では出品できない" do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end
end
