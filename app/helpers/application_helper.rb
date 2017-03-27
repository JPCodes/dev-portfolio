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

  # Maybe add blank tag type to delete app-nav class
  def nav_generator style, tag_type
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_path}" class="#{style} #{active? about_path}">About</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
NAV

  nav_links.html_safe
  end

  def active? path
    "active".html_safe if current_page? path
  end
end
