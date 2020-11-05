class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @transaction = ItemTransaction.new
  end

  def create
    @transaction = ItemTransaction.new(transaction_params)
    if @transaction.valid?
      @transaction.save
    end
    render 'index'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transaction_params
    params.require(:item_transaction).permit(:postal_code, :prefecture_id, :municipality, :number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

