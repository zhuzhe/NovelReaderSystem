require 'spec_helper'

describe "/novels/edit.html.erb" do
  include NovelsHelper

  before(:each) do
    assigns[:novel] = @novel = stub_model(Novel,
      :new_record? => false
    )
  end

  it "renders the edit novel form" do
    render

    response.should have_tag("form[action=#{novel_path(@novel)}][method=post]") do
    end
  end
end
