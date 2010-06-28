require 'spec_helper'

describe "/novels/show.html.erb" do
  include NovelsHelper
  before(:each) do
    assigns[:novel] = @novel = stub_model(Novel)
  end

  it "renders attributes in <p>" do
    render
  end
end
