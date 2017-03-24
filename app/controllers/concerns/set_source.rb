module SetSource
  extend ActiveSupport::Concern

  included do
    before_filter :set_source
  end
  
  def set_source
    # source param can be called anything
    session[:source] = params[:q] if params[:q]
  end
end
