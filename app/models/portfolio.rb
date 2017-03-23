class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
  after_initialize :set_defaults


  # Lame, vanilla syntax
  def self.angular
    where(subtitle: 'Angular')
  end

  # Alternate, cooler syntax
    # Any name for scope, ex: could be :ruby_on_rails_stuff
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  def set_defaults
    # ||= means if main_image nil then set to "string"
    self.main_image ||=  "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
