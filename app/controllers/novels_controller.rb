class NovelsController < ApplicationController
  # GET /novels
  # GET /novels.xml
  def index
    @category=Category.find(params[:category_id])
    @novels =@category.novels

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @novels }
    end
  end

  # GET /novels/1
  # GET /novels/1.xml
  def show
    @novel = Novel.find(params[:id])

#    @content=""
#   File.new(RAILS_ROOT+@novel.url,"r")do|file|
#     file.each_line {|line|@content+=line}
#     end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @novel }
    end
  end

  # GET /novels/new
  # GET /novels/new.xml
  def new
    @novel = Novel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @novel }
    end
  end

  # GET /novels/1/edit
  def edit
    @novel = Novel.find(params[:id])
  end

  # POST /novels
  # POST /novels.xml
  def create
    @novel = Novel.new(params[:novel])
    upload
    respond_to do |format|
      if @novel.save
        flash[:notice] = 'Novel was successfully created.'
        format.html { redirect_to(@novel) }
        format.xml  { render :xml => @novel, :status => :created, :location => @novel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @novel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /novels/1
  # PUT /novels/1.xml
  def update
    @novel = Novel.find(params[:id])

    respond_to do |format|
      if @novel.update_attributes(params[:novel])
        flash[:notice] = 'Novel was successfully updated.'
        format.html { redirect_to(@novel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @novel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /novels/1
  # DELETE /novels/1.xml
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy

    respond_to do |format|
      format.html { redirect_to(novels_url) }
      format.xml  { head :ok }
    end
  end

   def upload
    uploaded_io = params[:novel][:url]
    original_filename=uploaded_io.original_filename
    file_name=Time.now.to_s+original_filename
    File.open(Rails.root.join('public', 'novels', file_name), 'w') do |file|
      file.write(uploaded_io.read)
    end
    @novel.url="/public/novels/"+file_name
  end

   def read
      @novel= Novel.find(params[:id])
      @novel.click_count=@novel.click_count+1
      @novel.save
      redirect_to novel_chapters_path(@novel)
   end

   def download
     @novel=Novel.find(params[:id])
     send_file RAILS_ROOT+@novel.url
     @novel.download_count=@novel.download_count+1
     @novel.save
     return
   end

   def search
     @novels=[]
      if params[:condition]!="tag"
     @novels=Novel.all(:conditions=>"#{params[:condition]} like '%#{params[:key]}%'")
      else
        @tags=Tag.all(:conditions=>"name like '%#{params[:key]}%'")
        if !@tags.empty?
          @tags.each do |tag|
              @novels<<tag.novel
          end
        end
      end
   end

   def collect
      @account=current_account
      @novels=@account.novels
      novel=Novel.find(params[:id])

      if !@account.nil?
        if(!@novels.include?(novel))
         @novels<<novel
         @account.save
         @novels
        else
          flash[:notice]='you has already collected this novel'
        end
      else
        render :template=>'sessions/new'
      end
   end

   def cancel_collected
     @account=current_account
     if !@account.nil?
       @account.novels.delete(Novel.find(params[:id]))
       @account.save
        @novels=@account.novels
       render 'collect'
   else
     render :template=>'sessions/new'
   end
  end

  def collected
    account=current_account
    @novels=account.novels
    respond_to do |format|
      format.html
      format.xml{render :xml=>@novels}
    end
  end
end
