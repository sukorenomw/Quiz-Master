require 'rails_helper'

feature 'add question' do
  scenario 'question popup appear' do
    visit root_path
    click_link 'add-question'
    expect(page).to have_content('Add/Edit question')
  end
end