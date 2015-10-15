class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@user = User.find(params[:user_id])
  	@item = @user.items.create(item_params)

  	if @item.save
  		flash[:notice] = "Item was saved."
  		redirect_to @user
  	else
  		flash[:error] = "There was an error saving your item. Please try again."
  		redirect_to @user
  	end
  end

  private
  def item_params
  	params.require(:item).permit(:name)
  end
end
