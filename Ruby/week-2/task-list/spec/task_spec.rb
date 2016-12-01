require('rspec')
require('task')

describe(Task) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new("scrub the zebra")
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end
  describe(".all") do
    it("is empty at first") do
      expect(Task.all).to eq([])
    end
  end
  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("wash the lion")
      test_task.save()
      expect(Task.all).to(eq([test_task]))
    end
  end
  describe(".clear") do
    it("empties out all of the saved tasks") do
      Task.new("wash the lion").save
      Task.clear
      expect(Task.all).to eq([])
    end
  end
  describe("#delete") do
    it("removes the selected Task from the task list") do
      task1 = Task.new("wash the lion")
      task2 = Task.new("seek immediate medical attention")
      task3 = Task.new("google 'lion rabies'")
      task1.save
      task2.save
      task3.save
      task2.delete
      expect(Task.all).to eq([task1, task3])
    end
  end
end
