require('spec_helper')

describe(Task) do
  before(:all) do
    @learning_list = List.new({:name => "Coding Learning List"})
    @task1 = Task.new({:description => "learn SQL", :list_id => 1})
    @task1_copy = Task.new({:description => "learn SQL", :list_id => 1})
  end
  describe(":==") do
    it('is the same task if it has the same description') do
      expect(@task1).to eq @task1_copy
    end
  end

  describe(".all") do
    it("is empty at first, and will return all tasks") do
      expect(Task.all).to eq []
    end
  end

  describe("#save") do
    it("saves a task to the array") do
      @task1.save()
      expect(Task.all).to eq [@task1]
    end
  end
end
