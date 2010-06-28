class SessionsController < ApplicationController
  def new

  end
  
  def destroy
    session[:account_id]=nil
    flash[:notice]="you already log out"
    redirect_to root_path
  end
  
  def create
     @account=Account.authenticate(params[:email],params[:password])
     if @account.nil?
      flash[:notice]="username or password is error"
      render :new
    else
      session[:account_id]=@account.id
      redirect_to root_path
    end
  end
  
end
