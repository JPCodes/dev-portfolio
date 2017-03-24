class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist # Concerns file
  include SetSource
  include CurrentUserConcern
end
