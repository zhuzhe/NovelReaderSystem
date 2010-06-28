require 'spec_helper'

describe Novel do
  before(:each) do
      category = Factory.create(:category)
    @valid_attributes = {:name => "black and white" ,:url => "path to this novel", 
      :writer => "Belen",:category => cat　egory
    }
  end

  it "should create a new instance given valid attributes" do
    Novel.create!(@valid_attributes)
  end
end
