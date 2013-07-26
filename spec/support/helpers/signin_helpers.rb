module Features
  module JsHelpers
    def bypass_confirm_dialog
      # bypassing the confirm dialog
      # http://groups.google.com/group/ruby-capybara/browse_thread/thread/89760b6fcab7fd19
      # http://stackoverflow.com/questions/2458632/how-to-test-a-confirm-dialog-with-cucumber
      page.evaluate_script('window.confirm = function() { return true; }')
      page.evaluate_script('window.prompt = function() { return true; }')
    end
  end

  module SessionHelpers
    def signup_with(email)
      visit new_user_registration_path
      fill_in "E-mail", with: email
      click_button 'Signup'
    end

    def login_with(email, password)
      visit new_user_session_path
      fill_in "E-mail", with: email
      fill_in "Password", with: password
      click_button "Signin"
    end
  end
end
