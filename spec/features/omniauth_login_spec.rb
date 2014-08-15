describe 'user log in with omniauth', :type => :feature do

  let(:auth) { OmniAuth.config.mock_auth[:github_user] }

  it 'can log in with github' do 
    visit '/auth/github'
    expect(page).to have_content(auth["name"])
  end

  it 'can stay logged in, keeping session' do 
    visit '/auth/github'
    click_link 'flatiron-school-students'
    expect(page).to have_content(auth["name"])
    expect(page.get_rack_session_key('user_id')).to_not eq(nil)
  end

  it 'can log out, clearing session' do 
    visit '/auth/github'
    expect(page).to have_content(auth["name"])
    click_link 'Log Out'
    expect(current_path).to eq('/')
    expect(page).to have_content('Sign In with Github')
    expect(page.get_rack_session).to_not include('user_id')
  end
end