require 'rails_helper'

RSpec.describe "institutionportfolios/index", type: :view do
  before(:each) do
    assign(:institutionportfolios, [
      Institutionportfolio.create!(),
      Institutionportfolio.create!()
    ])
  end

  it "renders a list of institutionportfolios" do
    render
  end
end
