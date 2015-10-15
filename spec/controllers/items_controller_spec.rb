require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	let(:my_user) { create( :user ) }
	let(:my_item) { create( :item ) }

  context "guest" do
    before do
      login_with nil
    end

    describe "POST create" do
      before do
        post :create, user_id: my_user.id, item: { name: "List item"}
      end

      it "returns http redirect" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "user" do
  	before do
  		login_with my_user
  	end

  	describe "POST create" do
      before do
        post :create, user_id: my_user.id, item: { name: "List item" }
      end

      it "increases the number of items by 1" do
        expect{ post :create, user_id: my_user.id, item: {name: "List item"} }.to change(Item, :count).by(1)
      end

      it "assigns the new item to @item" do
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to the current user's profile" do
        expect(response).to redirect_to(my_user)
      end
    end
  end
end
