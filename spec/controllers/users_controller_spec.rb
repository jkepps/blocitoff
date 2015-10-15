require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:my_user) { create(:user) }

	context "guest" do
		describe "GET show" do
			it "returns http redirect" do
				login_with nil
				get :show, id: my_user.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	context "user" do
		describe "GET #show" do
			it "returns http success" do
				login_with my_user
				get :show, id: my_user.id
				expect(response).to have_http_status(:success)
			end
		end
	end
end
