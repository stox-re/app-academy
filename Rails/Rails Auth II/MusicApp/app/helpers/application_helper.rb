module ApplicationHelper
  def auth_token
    html = "<input "
    html += 'type="hidden" '
    html += 'name="authenticity_token" '
    html += "value=\"#{form_authenticity_token}\" "
    html += "/>"
    html.html_safe
  end

  def ugly_lyrics(lyrics)
    lyrics_with_formatting = ""
    lyrics.lines.each do |line|
      lyrics_with_formatting += "&#9835; #{html_escape(line)}"
    end
    "<pre>#{lyrics_with_formatting}</pre>".html_safe
  end

end
