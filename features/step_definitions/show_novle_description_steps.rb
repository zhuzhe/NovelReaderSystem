  Given "I haven't visit novel site" do
      @novel = Factory.create(:novel)
      !@novel.new_record?
  end
  
  When "I go into this site" do
    visit root_path
  end
  
  Then "I will see welcome" do
    response.body.should =~ /welcome/
  end
  
