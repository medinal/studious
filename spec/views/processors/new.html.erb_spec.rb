require 'rails_helper'

RSpec.describe "processors/new", type: :view do
  before(:each) do
    assign(:processor, Processor.new())
  end

  it "renders new processor form" do
    render

    assert_select "form[action=?][method=?]", processors_path, "post" do
    end
  end
end
