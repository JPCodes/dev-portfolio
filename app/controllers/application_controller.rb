class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist # Concerns file

  before_action :set_source

  def set_source
    # source param can be called anything
    session[:source] = params[:q] if params[:q]
  end
end
