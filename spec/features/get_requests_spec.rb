describe 'making get requests', :type => :feature do

  let!(:auth) { OmniAuth.config.mock_auth[:github_user] }

  before do
    visit '/auth/github'
    visit '/organizations'
  end

  context 'organizations' do 
    xit 'shows user organizations' do 
      expect(page).to have_content('flatiron-school')
    end
  end

  context 'repos' do
    before do 
      click_link 'flatiron-school'
    end 

    xit 'shows an organization repos' do 
      expect(page).to have_content('flatiron-rails')
    end
  end

  context 'issues' do 
    before do 
      click_link 'flatiron-school'
      click_link 'flatiron-rails'
    end
    
    xit 'shows a repo list of issues' do 
      expect(page).to have_content('Issue: Update to Rails 4.1.0')
    end
  end

end