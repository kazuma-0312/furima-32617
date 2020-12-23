class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :group_item, only: [:show, :edit, :update]

  def index
  @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new  
    end
  end  

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
    

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else  
      render :show
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :city_id, :days_id, :delivery_id, :status_id, :price).merge(user_id: current_user.id)
  end

  def group_item
    @item = Item.find(params[:id])
  end
end
