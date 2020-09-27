# Making radio buttons
<% Cat::COAT_COLORS.each do |coat_color| %>
  <label>
    <input type="radio" name="cat[coat_color]" value="<%= coat_color %>" <%= "checked" if cat.color == coat_color %>>
  </label>
<% end #%>

# Truncated version of description of cat
#<a href="<% cat_url %>">
  #(<%= cat.description.slice(0, 30) %>...)
#</a>

# Under /helpers/application_helper.rb
module ApplicationHelper
  def cat_link(cat)
    short_description = cat.description.slice(0, 30)
    short_description += "..." if cat.description.length > 20

    html = "<a href=\"#{cat_url}\">"
    html += "#{html_escape(cat.name)}"
    html += "#{html_escape(short_description)}"
    html += "</a>"
    html.html_safe # As a string literal. We need to escape it.
    # Escaping protectects against js injection
  end
end

<%= cat_link(cat) #%>

# app/helpers/application_helper.rb
module ApplicationHelper
  def highlight(text)
    "<strong class=\"highlight\">#{html_escape(text)}</strong>".html_safe
  end

  def picture_for(user)
    html = '<div class="user-picture">'
    html += "<img src=\"#{user.picture_url}\" alt=\"#{htmp_escape(user.name)}\">"
    html += '</div>'

    html.html_safe
  end
end