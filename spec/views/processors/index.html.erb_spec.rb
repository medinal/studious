require 'rails_helper'

RSpec.describe "processors/index", type: :view do
  before(:each) do
    assign(:processors, [
      Processor.create!(),
      Processor.create!()
    ])
  end

  it "renders a list of processors" do
    render
  end
end
