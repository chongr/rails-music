module ApplicationHelper
  def form_login_or_register(new_user)
    if new_user
      html_string = "<form action='#{users_url}' method='post'>"
    else
      html_string = "<form action='#{session_url}' method='post'>"
    end

    html_string
  end

  def button_login_or_register(new_user)
    if new_user
      html_string = "<button type='submit'>Register User</button>"
    else
      html_string = "<button type='submit'>Login</button>"
    end

    html_string
  end

  def form_new_or_edit(new_band, band)
    if new_band
      html_string = "<form action='#{bands_url}' method='post'>"
    else
      html_string = "<form action='#{band_url(band)}' method='post'>"
    end

    html_string
  end

  def button_new_or_edit(new_band)
    if new_band
      html_string = "<button type='submit'>Add Band</button>"
    else
      html_string = "<button type='submit'>Edit Band</button>"
    end

    html_string
  end

  def album_form_new_or_edit(new_album, album)
    if new_album
      html_string = "<form action='#{albums_url}' method='post'>"
    else
      html_string = "<form action='#{album_url(album)}' method='post'>"
    end

    html_string
  end

  def album_button_new_or_edit(new_album)
    if new_album
      html_string = "<button type='submit'>Add Album</button>"
    else
      html_string = "<button type='submit'>Edit Album</button>"
    end

    html_string
  end
end
