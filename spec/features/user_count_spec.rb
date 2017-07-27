feature 'Keeps record of user count' do
  scenario 'user signing in' do
    count = user.number
    visit('/')
    fill_in 'Email', with: 'makersacadmey@gmail.com'
    fill_in 'Password', with: '1234'
    click_button 'Submit'
    expect(user.number).to eq (count + 1)
  end
end
