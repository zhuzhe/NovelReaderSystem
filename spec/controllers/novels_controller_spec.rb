require 'spec_helper'

describe NovelsController do

  def mock_novel(stubs={})
    @mock_novel ||= mock_model(Novel, stubs)
  end

  describe "GET index" do
    it "assigns all novels as @novels" do
      Novel.stub!(:find).with(:all).and_return([mock_novel])
      get :index
      assigns[:novels].should == [mock_novel]
    end
  end

  describe "GET show" do
    it "assigns the requested novel as @novel" do
      Novel.stub!(:find).with("37").and_return(mock_novel)
      get :show, :id => "37"
      assigns[:novel].should equal(mock_novel)
    end
  end

  describe "GET new" do
    it "assigns a new novel as @novel" do
      Novel.stub!(:new).and_return(mock_novel)
      get :new
      assigns[:novel].should equal(mock_novel)
    end
  end

  describe "GET edit" do
    it "assigns the requested novel as @novel" do
      Novel.stub!(:find).with("37").and_return(mock_novel)
      get :edit, :id => "37"
      assigns[:novel].should equal(mock_novel)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created novel as @novel" do
        Novel.stub!(:new).with({'these' => 'params'}).and_return(mock_novel(:save => true))
        post :create, :novel => {:these => 'params'}
        assigns[:novel].should equal(mock_novel)
      end

      it "redirects to the created novel" do
        Novel.stub!(:new).and_return(mock_novel(:save => true))
        post :create, :novel => {}
        response.should redirect_to(novel_url(mock_novel))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved novel as @novel" do
        Novel.stub!(:new).with({'these' => 'params'}).and_return(mock_novel(:save => false))
        post :create, :novel => {:these => 'params'}
        assigns[:novel].should equal(mock_novel)
      end

      it "re-renders the 'new' template" do
        Novel.stub!(:new).and_return(mock_novel(:save => false))
        post :create, :novel => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested novel" do
        Novel.should_receive(:find).with("37").and_return(mock_novel)
        mock_novel.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :novel => {:these => 'params'}
      end

      it "assigns the requested novel as @novel" do
        Novel.stub!(:find).and_return(mock_novel(:update_attributes => true))
        put :update, :id => "1"
        assigns[:novel].should equal(mock_novel)
      end

      it "redirects to the novel" do
        Novel.stub!(:find).and_return(mock_novel(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(novel_url(mock_novel))
      end
    end

    describe "with invalid params" do
      it "updates the requested novel" do
        Novel.should_receive(:find).with("37").and_return(mock_novel)
        mock_novel.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :novel => {:these => 'params'}
      end

      it "assigns the novel as @novel" do
        Novel.stub!(:find).and_return(mock_novel(:update_attributes => false))
        put :update, :id => "1"
        assigns[:novel].should equal(mock_novel)
      end

      it "re-renders the 'edit' template" do
        Novel.stub!(:find).and_return(mock_novel(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested novel" do
      Novel.should_receive(:find).with("37").and_return(mock_novel)
      mock_novel.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the novels list" do
      Novel.stub!(:find).and_return(mock_novel(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(novels_url)
    end
  end

end
