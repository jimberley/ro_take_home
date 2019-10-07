class NewPatientLandingPage < SitePrism::Page
  require './test_helper'

  element :email_field, '#temporaryEmail'
  element :first_name_field, '#firstName'
  element :last_name_field, '#lastName'
  element :password_field, '#password'
  element :checkbox_label, '.checkbox-label'

  def click_agree_to_tos
    execute_script("document.querySelector('#agreedToTos').click()")
  end

  def click_exit_modal_button
    page.find('div[type="sidebar"]').find('button').click
  end

  def find_modal_heading(text)
    page.find('h2', text: text)
  end
end
