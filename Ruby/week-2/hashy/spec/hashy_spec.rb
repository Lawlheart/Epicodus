require('pry')
require("rspec")
require('hashy')

describe(Hashy) do
  describe('#store') do
    it('pushes key and value to corresponding arrays with same index point in each') do
      test_hashy = Hashy.new()
      expect(test_hashy.store("a", 1)).to eq 1
    end
  end
  describe('#fetch') do
    it('pulls value corresponding to a given key from the values array') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      expect(test_hashy.fetch("a")).to eq(1)
    end
  end
  describe('#key') do
    it('returns key of a given value') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      expect(test_hashy.key(1)).to eq "a"
    end
  end
  describe('#has_key?') do
    it('returns boolean of whether key exists or not') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      expect(test_hashy.has_key?("a")).to eq true
    end
  end
  describe('#keys') do
    it('returns all the keys') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      test_hashy.store("b", 2)
      test_hashy.store("c", 3)
      expect(test_hashy.keys).to eq(["a", "b", "c"])
    end
  end
  describe('#values') do
    it('returns all the values') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      test_hashy.store("b", 2)
      test_hashy.store("c", 3)
      expect(test_hashy.values).to eq([1, 2, 3])
    end
  end
  describe('#invert') do
    it('inverts the array') do
      test_hashy = Hashy.new()
      test_hashy.store("a", 1)
      inverted_hashy = test_hashy.invert
      expect(inverted_hashy.keys).to eq ([1])
    end
  end
end
