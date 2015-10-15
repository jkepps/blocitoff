require 'rails_helper'

RSpec.describe Item, type: :model do
	let(:user) { create( :user ) }
	let(:item) { create( :item ) }

	it { should belong_to(:user) }
	it { should validate_presence_of(:name) }
	it { should validate_length_of(:name).is_at_least(3) }

	describe "attributes" do
		it "should respond to name" do
			expect(item).to respond_to(:name)
		end
	end
end
