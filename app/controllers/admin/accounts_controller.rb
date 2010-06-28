class Admin::AccountsController < ApplicationController
     def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

     def new
       @account=Account.new
       respond_to do |format|
         format.html
         format.xml{render :xml=>@account}
       end
     end

     def destroy
        @account = Account.find(params[:id])
        @account.destroy

    respond_to do |format|
      format.html { redirect_to(adminaccounts_url) }
      format.xml  { head :ok }
    end
     end

     def create
       @account=Account.new(params[:account])

       if @account.save
         flash[:notice]="you already created a admin!"
         redirect_to adminaccounts_path
       else
         flash[:notice]="save admin is fail,please try again"
         render :new
       end

       respond_to do |format|
         format.html
         format.xml{render :xml=>@account}
       end
     end

     def edit
       @account=Account.find(params[:id])
       respond_to do |format|
         format.html
         format.xml{render :xml=>@account}
       end
     end

     def update
       @account=Account.find(params[:id])
       respond_to do |format|
         if @account.update_attributes(params[:account])
           flash[:notice]='successfull save account'
           format.html{redirect_to adminaccount_path(@account)}
           format.xml {render :xml=>@account}
         else
           format.html{render :edit}
           format.xml{render :xml=>@account.errors,:status=>:unprocessable_entity}
         end
       end
     end

     def show
       @account=Account.find(params[:id])
       respond_to do |format|
         format.html
         format.xml{render :xml=>@account}
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
