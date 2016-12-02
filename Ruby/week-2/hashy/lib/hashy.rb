require('sinatra')
require('sinatra/reloader')
require('./lib/hashy.rb')
also_reload('lib/**/*.rb')


class Hashy
  define_method(:initialize) do
    @keys = []
    @values = []
  end
  define_method(:store) do |key, value|
    @keys.push(key)
    @values.push(value)
    value
  end
  define_method(:fetch) do |key|
    index = @keys.index(key)
    @values[index]
  end
  define_method(:key) do |value|
    index = @values.index(value)
    @keys[index]
  end
  define_method(:has_key?) do |key|
    @keys.include?(key)
  end
  define_method(:keys) do
    @keys
  end
  define_method(:values) do
    @values
  end
  define_method(:invert) do
    temp = @keys
    @keys = @values
    @values = temp
    self
  end
end
