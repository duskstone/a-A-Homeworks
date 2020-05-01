class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true

  helper_method :current_user
  #QUESTION: potentially to use helper_methods in partials/forms?

  def login(user) #sets a new sesion token for our session token attribute
    session[:session_token] = User.reset_session_token #class method from User model
  end

  def current_user #helps us find the current user of this session
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!@current_user
  end

  def logout! #resest current user session token for possibly an extra layer of protection
    current_user.reset_session_token ##QUESTION: Why do we perform this if we have line 18?
    session[:session_token] = nil #making current session token nil
    @current_user = nil #making current user nil 
  end #effectively ending our session so no data persists into other user sessions
end 

# C - current_user
# E - ensure_logged_in
# L - login(user)
# L - logout!
# L - logged_in?
