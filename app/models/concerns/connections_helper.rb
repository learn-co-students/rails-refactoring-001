module ConnectionsHelper

def set_request(organization, repo, token)
    if organization == nil 
      Typhoeus::Request.new(
      "https://api.github.com/user/orgs",
      headers: {Authorization: "token #{token}"}
    )
    elsif repo == nil
      Typhoeus::Request.new(
      "https://api.github.com/orgs/#{organization}/repos",
      headers: {Authorization: "token #{token}"}
      )
    else
    Typhoeus::Request.new(
      "https://api.github.com/repos/#{organization}/#{repo}/issues",
      headers: {Authorization: "token #{token}"}
      )
    end
end

end