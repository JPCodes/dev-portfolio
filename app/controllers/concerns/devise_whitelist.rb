module DeviseWhitelist # naming matches filename
  #helper stuff
  extend ActiveSupport::Concern

  included  do
    #Run this method only if it's the devise controller
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
