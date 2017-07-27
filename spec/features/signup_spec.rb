feature 'Sign up' do

  scenario 'has a sign up form' do
    visit ('/sign_up')
    expect(page).to have_content ("Please sign up for Bookmark Manager")
  end

  scenario 'allows user to submit email and password for sign up' do
    visit('/')
    fill_in 'Email', with: 'makersacadmey@gmail.com'
    fill_in 'Password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content ('Links')
  end
end
