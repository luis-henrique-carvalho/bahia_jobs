module WebHelper
  def login(user)
    visit new_manage_client_user_session_path
    fill_in "E-mail", with: user.email
    fill_in "Senha", with: user.password
    click_button "Login"
  end
end
