require 'rails_helper'

RSpec.describe "processors/show", type: :view do
  before(:each) do
    @processor = assign(:processor, Processor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
