class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index
  before_action :sold_index, only: :index
  before_action :authenticate_user!, only: :index

  def index
    @transaction = ItemTransaction.new
  end

  def create
    @transaction = ItemTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transaction_params
    params.require(:item_transaction).permit(:postal_code, :prefecture_id, :municipality, :number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: transaction_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def sold_index
    unless @item.order.blank?
      redirect_to root_path
    end
  end
end