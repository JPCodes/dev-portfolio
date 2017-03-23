class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true

  # Lame, vanilla syntax
  def self.angular
    where(subtitle: 'Angular')
  end

  # Alternate, cooler syntax
    # Any name for scope, ex: could be :ruby_on_rails_stuff
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
