module ApplicationHelper
  def auth_token
    html = "<input "
    html += 'type="hidden" '
    html += 'name="authenticity_token" '
    html += "value=\"#{form_authenticity_token}\" "
    html += "/>"
    html.html_safe
  end

  def star
    html = "&#x2605;&nbsp;&nbsp;&nbsp;&nbsp;"
    html.html_safe
  end

  def star_no_space
    html = "&#x2605;&nbsp;&nbsp;"
    html.html_safe
  end

  def priv_star
    html = "&#x2606;&nbsp;&nbsp;&nbsp;&nbsp;"
    html.html_safe
  end
end
