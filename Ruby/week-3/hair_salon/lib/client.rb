class Client
  attr_reader :name, :id, :stylist_id

  define_method(:initialize) do |attrs|
    @name = attrs.fetch("name", attrs[:name])
    @id = attrs.fetch("id", attrs[:id])
    @stylist_id = attrs.fetch("stylist_id", attrs[:stylist_id])
    @id = @id.to_i if @id != nil
    @stylist_id = @stylist_id.to_i if @stylist_id != nil
  end

  define_singleton_method(:all) do
    DB.exec("SELECT * FROM clients;").map do |data|
      Client.new(data)
    end
  end

  define_singleton_method(:find) do |id|
    matches = Client.all.keep_if do |client|
      client.id == id
    end
    matches.first
  end

  define_method(:save) do
    stored = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = stored.first.fetch("id").to_i
    self
  end

  define_method(:==) do |other|
    @name == other.name && @id == other.id && self.class == other.class && @stylist_id == other.stylist_id
  end

  define_method(:update) do |attrs|
    @name = attrs.fetch("name", attrs.fetch(:name, @name))
    @stylist_id = attrs.fetch("stylist_id", attrs.fetch(:stylist_id, @stylist_id))
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id or "NULL"} WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end

  define_method(:stylist) do
    Stylist.find(@stylist_id)
  end

  define_method(:remove_stylist) do
    @stylist_id = nil
    DB.exec("UPDATE clients SET stylist_id = NULL WHERE id = #{@id};")
  end

end
