require 'rails_helper'

RSpec.describe "processors/edit", type: :view do
  before(:each) do
    @processor = assign(:processor, Processor.create!())
  end

  it "renders the edit processor form" do
    render

    assert_select "form[action=?][method=?]", processor_path(@processor), "post" do
    end
  end
end
