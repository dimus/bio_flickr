# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :login_required

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'cdb6a5d692edc46339a3b44a84f1d582'
  
  # Returns true or false if the user is logged in.
  # Preloads @current_user with the user model if they're logged in.
  def logged_in?
    current_user != :false
  end
  
  
  def current_user
    @current_user ||= (session[:user_id] && User.find_by_id(session[:user_id])) || :false
  end
  
  # Store the given user in the session.
  def current_user=(new_user)
    session[:user_id] = new_user.id
    @current_user = new_user
  end
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def login_required
     (logged_in? || (controller_name == 'sessions')) ? true : access_denied
  end
   
  # Redirect as appropriate when an access request fails.
  #
  # The default action is to redirect to the login screen.
  #
  # Override this method in your controllers if you want to have special
  # behavior in case the user is not authorized
  # to access the requested action.  For example, a popup window might
  # simply close itself.
  def access_denied
    redirect_to :controller => 'sessions', :action => 'new'
    false
  end
end
