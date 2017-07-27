require 'database_cleaner'

feature 'creating new links' do
  scenario 'redirect to add a link' do
    visit('/links')
    click_button 'add link'
    expect(page).to have_content('Please add a new link')
  end

  scenario 'add link to the list' do
    visit('/links')
    click_button 'add link'
    fill_in 'title', with: 'makersWelcome'
    fill_in 'url', with: 'http://www.makersacademy.com/welcome'
    click_button 'Create link'
    expect(page).to have_content 'Title: makersWelcome'
  end
end
