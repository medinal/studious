require 'rails_helper'

RSpec.describe "Processors", type: :request do
  describe "GET /processors" do
    it "works! (now write some real specs)" do
      get processors_path
      expect(response).to have_http_status(200)
    end
  end
end
