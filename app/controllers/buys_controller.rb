class BuysController < ApplicationController
  before_action :group_item, only: [:index, :create]
  def index
    @home_buy = HomeBuy.new
  end

  def create
    @home_buy = HomeBuy.new(home_buy_params)
    if @home_buy.valid?
      pay_item
      @home_buy.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def group_item
    @item = Item.find(params[:item_id])
  end

  def home_buy_params
    params.require(:home_buy).permit(:address, :city_id, :municipality, :street, :building, :number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: home_buy_params[:token],    
      currency: 'jpy'                 
    )
  end

end
