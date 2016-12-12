require('spec_helper')

describe Task do
  describe '.not_done' do
    it 'returns all tasks that are not completed' do
      not_done_task1 = Task.create({:description => "gotta do it", :done => false})
      not_done_task2 = Task.create({:description => "gotta do it too", :done => false})
      Task.create({:description => "done task", :done => true})
      expect(Task.not_done).to eq [not_done_task1, not_done_task2]
    end
  end

  describe '#list' do
    it "tells which list it belongs to" do
      test_list = List.create({:name => "list"})
      test_task = Task.create({:description => "task", :list_id => test_list.id})
      expect(test_task.list).to eq test_list
    end
  end
end
