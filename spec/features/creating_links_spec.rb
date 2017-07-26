feature 'creating links' do
  scenario 'Visiting homepage' do
    visit('/links')
    click_button 'add link'
    expect(page).to have_content('Please add a new link')
  end
end
