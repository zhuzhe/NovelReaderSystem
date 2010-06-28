require 'spec_helper'

describe "/novels/new.html.erb" do
  include NovelsHelper

  before(:each) do
    assigns[:novel] = stub_model(Novel,
      :new_record? => true
    )
  end

  it "renders new novel form" do
    render

    response.should have_tag("form[action=?][method=post]", novels_path) do
    end
  end
end
