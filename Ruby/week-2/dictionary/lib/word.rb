class Word
  @@word_list
  attr_reader :name, :definition_list, :types
  define_method(:initialize) do |attrs|
    @name = attrs.fetch(:name)
    @definition_list = []
    @types = []
  end

  define_method(:add_definition) do |new_definition|
    @definition_list.push(new_definition)
    unless @types.include?(new_definition.type)
      @types.push(new_definition.type)
    end
  end
end