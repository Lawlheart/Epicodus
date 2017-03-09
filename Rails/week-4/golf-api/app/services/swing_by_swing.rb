class SwingBySwing
  def self.course_search_by_name(name)
    url="https://api.swingbyswing.com/v2/courses/search_by_term?name=#{name}&hole_count=18&from=1&limit=20&access_token=#{ENV['access_token']}"
    response = RestClient.get(url).body
    courseData = JSON.parse(response)
    courseData["courses"]
  end

  def self.get_course(course_id)
    url="https://api.swingbyswing.com/v2/courses/#{course_id}?access_token=#{ENV['access_token']}"
    puts url
    response = RestClient.get(url).body
    courseData = JSON.parse(response)
    courseData["course"]
  end
end
