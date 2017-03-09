class ReposController < ApplicationController
  def index
    @repos = GithubService.get_user_repos.map{|repo| Repo.new(repo)}
  end
end