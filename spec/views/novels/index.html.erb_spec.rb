require 'spec_helper'

describe "/novels/index.html.erb" do
  include NovelsHelper

  before(:each) do
    assigns[:novels] = [
      stub_model(Novel),
      stub_model(Novel)
    ]
  end

  it "renders a list of novels" do
    render
  end
end
