class OrganizationsController < ApplicationController
  before_action :github_connection, only: [:index, :show]

  def index
    @username = current_user.username
    @organizations = @github.get_organizations
  end

  def show
    @repos = @github.get_repos(params[:organization])
  end

  private
  def github_connection
    @github = GithubConnection.new(current_user)
  end
end
