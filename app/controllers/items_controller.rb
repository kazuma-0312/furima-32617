class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
before_action :group_item, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id && @item.buy == nil
  end
    

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      else
        render :show, alert: "Failed to delete"
      end
    else
      redirect_to root_path
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
