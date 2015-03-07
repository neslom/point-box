def login_as(user)
  visit login_path

  fill_in "session[username]", with: user.username
  fill_in "session[password]", with: user.password

  click_link_or_button "Log in"
end
