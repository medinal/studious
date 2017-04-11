require 'rails_helper'

RSpec.describe "institutionportfolios/edit", type: :view do
  before(:each) do
    @institutionportfolio = assign(:institutionportfolio, Institutionportfolio.create!())
  end

  it "renders the edit institutionportfolio form" do
    render

    assert_select "form[action=?][method=?]", institutionportfolio_path(@institutionportfolio), "post" do
    end
  end
end
