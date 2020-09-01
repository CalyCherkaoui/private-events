module ApplicationHelper
  def login_helper
    if session[:current_user_id].nil?
      link_to 'login', login_path
      link_to 'Signup', signup_path
    else
      session[:current_user_fullname]
      link_to 'log out', logout_path
    end
  end
end
