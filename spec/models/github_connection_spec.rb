describe 'GithubConnection', :type => :model do
  
  
  let(:auth) { OmniAuth.config.mock_auth[:github] }
  let(:user) { User.create_with_omniauth(auth) }
  let(:github_connection) { GithubConnection.new(user) }
    
  
  describe '#get_organizations' do 
    it 'returns the current users orgs' do
      VCR.use_cassette('vcr/organizations') do 
        expect(github_connection.get_organizations).to eq(["flatiron-school", "flatiron-labs", "DEV-learn-co-students", "learn-co-students"]) 
      end
    end
  end

  describe '#get_repos' do 
    it 'returns the current users repos' do
      VCR.use_cassette('vcr/repos') do 
        expect(github_connection.get_repos("flatiron-school")).to eq(repos) 
      end
    end
  end

  describe '#get_issues' do 
    it 'returns the issues of a given repo that belongs to the current user' do 
      VCR.use_cassette('vcr/issues') do
        expect(github_connection.get_issues("flatiron-school", "progress-tracker")).to eq(issues)
      end
    end
  end
end

