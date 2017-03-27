module ApplicationHelper
  # No parenthesis needed for params
    # Empty string is default argument
  def login_helper style = '', separator = ''
     if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      separator.html_safe +
      (link_to "Login", new_user_session_path, class: style)
     else
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end
  end


  def source_helper(layout_name)
     if session[:source]
       greeting = "Thanks for visiting from #{session[:source]}, layout: #{layout_name}"
      content_tag(:p, greeting, class: 'source-greeting')
     end
  end

  def copyright_generator
    ViewFooterCopyright::Renderer.copyright 'Jim Padilla', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end

  def nav_generator style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active".html_safe if current_page? path
  end
end
