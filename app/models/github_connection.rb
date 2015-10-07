class GithubConnection
  attr_reader :username, :token, :orgs, :repos, :issues
  
  def initialize(auth_data)
    @username = auth_data["username"]
    @token = auth_data["token"]
  end

  # GET request to get user's organizations; method called on instance in the organizations controller
  def get_organizations
    request = Typhoeus::Request.new(
      "https://api.github.com/user/orgs",
      headers: {Authorization: "token #{token}"}
    )
    response = request.run
    orgs = JSON.parse(response.body).map do |org| 
      org["login"]
    end
  end

  # GET request to get all of an organization's repos; method called on instance in the organizations controller
  def get_repos(organization)
    request = Typhoeus::Request.new(
      "https://api.github.com/orgs/#{organization}/repos",
      headers: {Authorization: "token #{token}"}
      )
    response = request.run
    repos = JSON.parse(response.body).map do |repo|
      repo["name"]
    end
  end

  # GET request to get all of a repos issues; method called on instance in the repos controller
  def get_issues(organization, repo)
    request = Typhoeus::Request.new(
      "https://api.github.com/repos/#{organization}/#{repo}/issues",
      headers: {Authorization: "token #{token}"}
      )
    response = request.run
    repos = JSON.parse(response.body).map do |issue|
      issue
    end
  end
end