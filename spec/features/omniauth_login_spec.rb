describe 'user log in with omniauth', :type => :feature do

  let!(:auth) { OmniAuth.config.mock_auth[:github] }

  before do
    page.set_rack_session("github" => {
      :uid => auth["uid"], 
      :username => auth["info"]["nickname"], 
      :email => auth["info"]["email"], 
      :token => auth["credentials"]["token"]
    })
    visit '/organizations'
  end

  context 'logged in' do 
    it 'can log in with github' do 
      expect(page).to have_content("#{auth["info"]["nickname"]}'s Organizations")
    end

    it 'can stay logged in, keeping session' do 
      click_link 'learn-co-students'
      expect(page.get_rack_session_key('github')["uid"]).to_not eq(nil)
    end
  end

  context 'logged out' do
    before do 
      click_link 'Log Out'
    end 

    it 'can log out' do 
      expect(current_path).to eq('/')
      expect(page).to have_content('Sign in with Github')
    end

    it 'clears the session' do 
      expect { page.get_rack_session_key('github')}.to raise_error
    end
  end

end