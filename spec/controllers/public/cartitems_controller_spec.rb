require 'rails_helper'

RSpec.describe Public::CartitemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_item" do
    it "returns http success" do
      get :add_item
      expect(response).to have_http_status(:success)
    end
  end

end
