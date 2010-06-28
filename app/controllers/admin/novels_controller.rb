class Admin::NovelsController < ApplicationController
    def index

    @novels =Novel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @novels }
    end
  end
end
