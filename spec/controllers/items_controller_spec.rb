require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	let(:my_user) { create( :user ) }
	let(:my_item) { create( :item ) }
  let(:other_user) { create( :user) }

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

    describe "PUT complete" do
      before do
        put :toggle_complete, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "returns http redirect" do
        expect(response).to have_http_status(401)
      end
    end

    describe "DELETE destroy" do
      before do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "returns http redirect" do
        expect(response).to have_http_status(401)
      end
    end
  end

  context "user doing CRUD on an item they don't own" do
    before do
      login_with other_user
    end

    describe "POST create" do
      before do
        post :create, user_id: my_user.id, item: { name: "List item"}
      end

      it "returns http redirect" do
        expect(response).to redirect_to(my_user)
      end
    end

    describe "PUT complete" do
      before do
        put :toggle_complete, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "returns http redirect" do
        expect(response).to redirect_to(my_user)
      end
    end

    describe "DELETE destroy" do
      before do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "returns http redirect" do
        expect(response).to redirect_to(my_user)
      end
    end
  end

  context "user doing CRUD on an item they do own" do
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

    describe "PUT complete" do
      before do
        put :toggle_complete, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "toggles complete attribute" do
        expect(my_item[:complete]).to be_truthy
      end
    end

    describe "DELETE destroy" do
      before do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      end

      it "deletes the item" do
        count = Item.where({id: my_item.id}).size
        expect(count).to eq(0)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
