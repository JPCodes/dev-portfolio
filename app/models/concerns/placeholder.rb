module Placeholder
  #loads in some helper modules
  extend ActiveSupport::Concern

  #use height and width when called
  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
end
