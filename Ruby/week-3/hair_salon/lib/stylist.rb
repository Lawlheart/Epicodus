class Stylist
  attr_reader :name, :id

  define_method(:initialize) do |attrs|
    @name = attrs.fetch("name", attrs[:name])
    @id = attrs.fetch("id", attrs[:id])
    @id = @id.to_i if @id != nil
  end

  define_singleton_method(:all) do
    DB.exec("SELECT * FROM stylists;").map do |data|
      Stylist.new(data)
    end
  end

  define_singleton_method(:find) do |id|
    matches = Stylist.all.keep_if do |stylist|
      stylist.id == id
    end
    matches.first
  end

  define_method(:==) do |other|
    @name == other.name && @id == other.id rescue false
  end

  define_method(:save) do
    data = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = data.first.fetch("id").to_i
    self
  end

  define_method(:update) do |attrs|
    @name = attrs.fetch("name", attrs.fetch(:name, @name))
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("UPDATE clients SET stylist_id = NULL WHERE id = #{@id};")
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  define_method(:add_client) do |client|
    client.update({:stylist_id => @id})
  end

  define_method(:clients) do
    DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id};").map do |data|
      Client.new(data)
    end
  end

end
