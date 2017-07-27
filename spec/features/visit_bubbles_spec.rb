feature "able to filter links" do
  before do
    Link.create(url: 'http://www.bbc.com', title: 'BBC', tags: [Tag.first_or_create(name: 'Television')])
    Link.create(url: 'http://www.thequardian.com', title: 'The Guardian', tags: [Tag.first_or_create(name: 'newspaper')])
    Link.create(url: 'http://www.apple.com', title: 'Apple', tags: [Tag.first_or_create(name: 'Phones')])
    Link.create(url: 'http://www.amazon.com', title: 'Amazon', tags: [Tag.first_or_create(name: 'Books')])
  end
  scenario 'visiting bubbles' do
    visit('/tags/newspaper')
    expect(page).to have_content('The Guardian')
  end

  scenario 'add a tag to a link' do
    visit('/links')
    click_button 'add link'
    fill_in 'title', with: 'makersWelcome'
    fill_in 'url', with: 'http://www.makersacademy.com/welcome'
    fill_in 'tags', with: 'code'
    click_button 'Create link'
    link = Link.first(title: 'makersWelcome')
    expect(page).to have_content 'code'
    expect(link.tags.map(&:name)).to include('code')
  end

    scenario 'adding multiple tags' do
      visit('/links')
      click_button 'add link'
      fill_in 'title', with: 'Google'
      fill_in 'url', with: 'http://www.google.com'
      fill_in 'tags', with: 'Search Great'
      click_button 'Create link'
      link = Link.first(title: 'Google')
      expect(link.tags.map(&:name)).to include('Search', 'Great')
  end
end
