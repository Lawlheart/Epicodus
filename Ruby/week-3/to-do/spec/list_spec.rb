require('spec_helper')

describe(List) do
  describe("#initialize") do
    it('sets id to nil if no id is provided') do
      list = List.new({:name => "Epicodus stuff"})
      expect(list.id).to eq nil
      expect(list.due).to eq nil
    end
  end

  describe(".all") do
    it('starts with an empty list of lists') do
      expect(List.all).to eq []
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff"})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets an id to the task when you save it") do
      list = List.new({:name => "Epicodus stuff" })
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff"})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff"})
      list2 = List.new({:name => "Epicodus stuff"})
      expect(list1).to(eq(list2))
    end
  end

  describe("#get_tasks") do
    it("returns all the tasks that belong to the list") do
      @learning_list = List.new({:name => "Coding Learning List"})
      @learning_list.save
      fk = @learning_list.id
      @task1 = Task.new({:description => "learn SQL", :list_id => fk})
      @task2 = Task.new({:description => "learn Ruby", :list_id => nil})
      @task3 = Task.new({:description => "learn JavaScript", :list_id => fk})

      @task1.save
      @task2.save
      @task3.save
      expect(@learning_list.get_tasks).to eq [@task1, @task3]
    end
  end
end
