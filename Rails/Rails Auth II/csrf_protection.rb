# Adding CSRF protection
helper_method :my_csrf_token

def my_csrf_token
  self.session[:my_csrf_token] ||= SecureRandom::urlsafe_base64
end

before_filter :validate_csrf_token # Before running the controller action for this url, run this validate_csrf_token
def validate_csrf_token
  return if self.request.method == "GET"
  return if self.session[:my_csrf_token] == self.params[:my_csrf_token]
  raise "CSRF Attack detected"
end

<form action="/users/counter" method="POST">
  <input type="hidden" name="_method" value="PUT">
  <input type="hidden" name="_my_csrf_token" value="<% my_csrf_token %>"
</form>

# Rails has csrf protection built in
# -------- Using CSRF Protection in Rails -----------

<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end