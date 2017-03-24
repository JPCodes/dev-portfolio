module CurrentUserConcern
  extend ActiveSupport::Concern
  # Overriding (or Overloading) old current_user method
  def current_user
    # if current_user exists, leave it be. If super is false, then return guest_user.
      # Righthand side is "null object pattern", openstruct
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest",
                  first_name: 'Guest',
                  last_name: 'Guest',
                  email: 'guest@site.com'
  )
  end
end
