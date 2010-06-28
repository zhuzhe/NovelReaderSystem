  class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to new_session_path }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end

   def change_password
       @account=Account.find(params[:id])
     end
     def update_password
       @account=Account.find(params[:id])
       respond_to do |format|
       if params[:new_password]==params[:confirmation_new_password]
       sha_password=Account.encrypted_pwd(params[:new_password])
       @account.pwd=sha_password
          if @account.save
            flash[:notice]='修改密码成功'
            format.html{render :change_password}
            format.xml{render :xml=>"修改密码成功"}
          else
             flash[:notice]='修改密码失败'
           format.html{render :change_password}
           format.xml{render :xml=>"密码没有成功修改,请再试一次"}
          end
       else
         flash[:notice]='输入的密码不一致,请重新输入'
         format.html{ render :change_password}
         format.xml{render :xml=>"输入的密码不一致,请重新输入"}
       end
       end
     end
end
