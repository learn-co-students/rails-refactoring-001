describe 'making get requests', :type => :feature do

  let!(:auth) { OmniAuth.config.mock_auth[:github_user] }

  before do
    page.set_rack_session("github" => {
      :uid => auth["uid"], 
      :username => auth["info"]["nickname"], 
      :email => auth["info"]["email"], 
      :token => auth["credentials"]["token"]
    })
    visit '/organizations'
  end

  context 'organizations' do 
    it 'shows user organizations' do 
      expect(page).to have_content('flatiron-school')
    end
  end

  context 'repos' do
    before do 
      click_link 'flatiron-school'
    end 

    it 'shows an organization repos' do 
      expect(page).to have_content('flatiron-rails')
    end
  end

  context 'issues' do 
    before do 
      click_link 'flatiron-school'
      click_link 'flatiron-rails'
    end
    
    it 'shows a repo list of issues' do 
      expect(page).to have_content('Issue: Update to Rails 4.1.0')
    end
  end

end