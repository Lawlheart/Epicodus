class Repo
  attr_accessor :name, :description, :url, :homepage
  def initialize(attrs)
    @name = attrs['name']
    @description = attrs['description']
    @url = attrs['html_url']
    @homepage = attrs['homepage']
  end
end