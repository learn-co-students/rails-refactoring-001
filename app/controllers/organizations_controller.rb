class OrganizationsController < ApplicationController
  before_action :github_connection, only: [:index, :show]

  def index
    @username = @github.username
    @organizations = @github.get_organizations
  end

  def show
    @repos = @github.get_repos(params[:organization])
  end

  private
  def github_connection
    @github = GithubConnection.new(session['github'])
  end
end
