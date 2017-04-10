require 'rails_helper'

RSpec.describe "institutionportfolios/show", type: :view do
  before(:each) do
    @institutionportfolio = assign(:institutionportfolio, Institutionportfolio.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
