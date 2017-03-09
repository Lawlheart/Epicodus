class GithubService

  def self.get_user_repos
    response = RestClient.get("https://api.github.com/users/#{ENV['GITHUB_USERNAME']}/repos?sort=updated&access_token=#{ENV['GITHUB_API_KEY']}")
    JSON.parse(response)
  end
end