require 'rails_helper'

describe ItemTransaction do
  before do
    @user = FactoryBot.create(:user)
    @buyer = FactoryBot.create(:user, email: "aaa@aaa", nickname: "testsan")
    @item = FactoryBot.create(:item, user_id: @user.id)
    @transaction = FactoryBot.build(:item_transaction,item_id: @item.id, user_id: @user.id, order_id: @buyer.id)

    sleep 0.5
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "postal_codeとprefecture_id,municipalityとnumber,phone_numberが存在すれば購入できる" do
        expect(@transaction).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと出品できない" do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンが無いと出品できない" do
        @transaction.postal_code = "2160035"
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefecture_idが1だと出品できない" do
        @transaction.prefecture_id = 1
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "municipalityが空だと出品できない" do
        @transaction.municipality = ""
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Municipality can't be blank")
      end
      it "numberが空だと出品できない" do
        @transaction.number = ""
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Number can't be blank")
      end
      it "phone_numberが空だと出品できない" do
        @transaction.phone_number = ""
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberがハイフンは不要で、12桁以上だと出品できない" do
        @transaction.phone_number = "090-1234-5678"
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end

  end
end