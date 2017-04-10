require 'rails_helper'

RSpec.describe "institutionportfolios/new", type: :view do
  before(:each) do
    assign(:institutionportfolio, Institutionportfolio.new())
  end

  it "renders new institutionportfolio form" do
    render

    assert_select "form[action=?][method=?]", institutionportfolios_path, "post" do
    end
  end
end
