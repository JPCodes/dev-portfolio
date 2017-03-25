module CurrentUserConcern
  extend ActiveSupport::Concern
  # Overriding (or Overloading) old current_user method
  def current_user
    # if current_user exists, leave it be. If super is false, then return guest_user.
      # Righthand side is "null object pattern", openstruct
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end
