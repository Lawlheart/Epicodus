class List
  attr_reader(:name, :id, :due)

  define_method(:initialize) do |attrs|
    @name = attrs.fetch(:name)
    @id = attrs.fetch(:id) rescue nil
    @due = attrs.fetch(:due) rescue nil

  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |other|
    @name == other.name and @id == other.id
  end

  define_method(:get_tasks) do
    Task.all.keep_if do |task|
      task.list_id == @id
    end
  end
end
