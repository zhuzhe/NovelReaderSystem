# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def current_account
    if session[:account_id].nil?
      flash[:notice]="please login!"
      return nil
    else
      Account.find(session[:account_id])
    end
  end
end
