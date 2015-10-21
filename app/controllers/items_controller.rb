class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:create, :destroy, :toggle_complete]

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

  def toggle_complete
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
    complete = @item.complete

    @item.update_attributes(complete: !complete)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def destroy
  	@user = User.find(params[:user_id])
  	@item = Item.find(params[:id])

		if @item.destroy

		else
			flash[:error] = "There was an error deleting the item. Please try again."
			redirect_to @user
		end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  private
  def item_params
  	params.require(:item).permit(:name)
  end

  def authorize_user
    user = User.find(params[:user_id])
    unless current_user == user
      flash[:alert] = "You do not have permission to do that."
      redirect_to user
    end
  end
end
