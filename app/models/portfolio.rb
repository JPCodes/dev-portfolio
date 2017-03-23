class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
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
    self.main_image ||=  Placeholder.image_generator(height: 600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
  end
end
