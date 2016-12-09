class Task
  attr_reader :description, :list_id, :due

  define_method(:initialize) do |attrs|
    @description = attrs.fetch(:description)
    @list_id = attrs.fetch(:list_id) rescue nil
    @due = attrs.fetch(:due) rescue nil
  end

  define_method(:==) do |other|
     @description.eql? other.description and @list_id == other.list_id
  end

  def self.all
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id or "NULL"});")
    # DB.exec("INSERT INTO tasks (description) VALUES ('pet cat')")
  end
end
