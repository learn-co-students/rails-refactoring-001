class ReposController < ApplicationController
  before_action :github_connection, only: [:show]

  def show
    @repo = params[:repo]
    @organization = params[:organization]
    @issues = @github.get_issues(@organization, @repo)
    respond_to do |format|
      format.html
    end
  end

  private
  def github_connection
    @github = GithubConnection.new(current_user)
  end
end
