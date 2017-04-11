require 'rails_helper'

RSpec.describe "Institutionportfolios", type: :request do
  describe "GET /institutionportfolios" do
    it "works! (now write some real specs)" do
      get institutionportfolios_path
      expect(response).to have_http_status(200)
    end
  end
end
