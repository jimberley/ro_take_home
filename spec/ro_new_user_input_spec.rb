require './spec/test_helper'
require './spec/page_objects/new_patient_landing_page'

describe 'User can input personal information on apt landing', type: :feature do
  it 'as a new user, navigates to new apt landing; correct elements appear' do
    visit BASE_URL + 'rory/vaginal-dryness'
    @new_patient_page = NewPatientLandingPage.new
    expect(@new_patient_page.email_field.visible?).to be_truthy
    expect(@new_patient_page.first_name_field.visible?).to be_truthy
    expect(@new_patient_page.last_name_field.visible?).to be_truthy
    expect(@new_patient_page.password_field.visible?).to be_truthy
    expect(@new_patient_page.checkbox_label.visible?).to be_truthy
    expect(page.find_button('Start my visit')).to be_truthy
  end

  it 'entering valid user data allows for submission' do
    visit BASE_URL + 'rory/vaginal-dryness'
    @new_patient_page = NewPatientLandingPage.new
    @new_patient_page.email_field.send_keys('Boy@george.com')
    @new_patient_page.first_name_field.send_keys('Boy')
    @new_patient_page.last_name_field.send_keys('George')
    @new_patient_page.password_field.send_keys('Password')
    @new_patient_page.click_agree_to_tos
    page.find_button('Start my visit').click
    page.find('.tabs-button', text: "Here", wait: 5000)
    expect(current_url.include?('online-visit/10')).to be_truthy
  end

  it 'terms and conditions links function as expected' do
    visit BASE_URL + 'rory/vaginal-dryness'
    @new_patient_page = NewPatientLandingPage.new
    page.find_button('terms').click
    expect(@new_patient_page.find_modal_heading('Terms of use'))
    @new_patient_page.click_exit_modal_button
    page.find_button('privacy policy').click
    expect(@new_patient_page.find_modal_heading('Privacy policy'))
    @new_patient_page.click_exit_modal_button
    page.find_button('telehealth').click
    expect(@new_patient_page.find_modal_heading('Consent to telehealth'))
    @new_patient_page.click_exit_modal_button
    expect(page.find_button('Help?').visible?)
  end
end
