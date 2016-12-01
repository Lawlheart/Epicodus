class Task
  @@all_tasks = []

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    @@all_tasks
  end

  define_method(:save) do
    @@all_tasks.push(self)
  end

  define_singleton_method(:clear) do
    @@all_tasks = []
  end

  define_method(:delete) do
    task_index = @@all_tasks.index(self)
    @@all_tasks.delete_at(task_index)
  end
end
