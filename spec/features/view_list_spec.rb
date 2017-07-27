feature "view the list of bookmarks" do
  scenario 'visiting homepage' do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/links')
      expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content "Makers Academy"
    end
  end
end

feature "Has welcome message" do
  scenario 'when signed in' do
    visit('/')
    fill_in 'Email', with: 'makersacadmey@gmail.com'
    fill_in 'Password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content ("Welcome, your email is     makersacadmey@gmail.com")
  end
end
