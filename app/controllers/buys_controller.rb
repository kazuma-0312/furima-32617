class BuysController < ApplicationController

  def index
    @home_buy = HomeBuy.new
  end

  def create
    @home_buy = HomeBuy.new(home_buy_params)
    if @home_buy.valid?
      @home_buy.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def home_buy_params
    params.require(:home_buy).permit(:address, :city_id, :municipality, :street, :building, :number).merge(item_id: params[:item_id], user_id: current_user.id)
  end


end
