# Bundler creates a class named "Definition", so I'm using "Term"
class Term
  attr_reader :definition, :type
  define_method(:initialize) do |attrs|
    @definition = attrs.fetch(:definition)
    @type = attrs.fetch(:type)
  end
end