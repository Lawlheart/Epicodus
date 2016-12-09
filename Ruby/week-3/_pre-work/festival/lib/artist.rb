class Artist
  define_method(:initialize) do |attrs|
    @name = attrs.fetch(:name)
    @members = attrs.fetch(:members)
    @genre = attrs.fetch(:genre)
  end
end