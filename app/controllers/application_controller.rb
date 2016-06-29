class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render 'shared/404'
  end

  rescue_from ActionView::MissingTemplate do |exception|
    redirect_to root_path
  end
end
