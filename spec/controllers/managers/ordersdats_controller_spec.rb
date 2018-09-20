require 'rails_helper'

RSpec.describe Managers::OrdersdatsController, type: :controller do

  describe "GET #sum_dat" do
    it "returns http success" do
      get :sum_dat
      expect(response).to have_http_status(:success)
    end
  end

end
