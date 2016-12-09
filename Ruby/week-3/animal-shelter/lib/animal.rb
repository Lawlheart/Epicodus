class Animal
  attr_reader(:id, :name, :type, :breed, :gender, :date, :person_id)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @type = attrs[:type]
    @breed = attrs[:breed]
    @gender = attrs[:gender]
    @date = attrs.fetch(:date, Time.now.to_s.split(" ").first)
    @person_id = attrs[:person_id]
  end

  def save
    if @id == nil
    saved = DB.exec("INSERT INTO  animals (name, type, breed, gender, date, person_id) VALUES ('#{@name}', '#{@type}', '#{@breed}', '#{@gender}', '#{@date}', #{@person_id or 'NULL'}) RETURNING id;")
      @id = saved.first["id"].to_i
    else
      DB.exec("UPDATE animals SET name = '#{@name}', type = '#{@type}', breed = '#{@breed}', gender = '#{@gender}', date = '#{@date}', person_id = #{@person_id or 'NULL'} WHERE id = #{@id};")
    end
  end

  def ==(other)
    @name == other.name && \
    @type == other.type && \
    @breed == other.breed && \
    @gender == other.gender
  end

  def adopted_by(person)
    @person_id = person.id
  end

  class << self
    def all
      DB.exec("Select * FROM animals;").map do |animal|
        Animal.new({
          :id => animal["id"],
          :name => animal["name"],
          :type => animal["type"],
          :breed => animal["breed"],
          :gender => animal["gender"],
          :date => animal["date"],
          :person_id => animal["person_id"]
        })
      end
    end

    def all_sorted_by(option)
      DB.exec("SELECT * FROM animals ORDER BY #{option.downcase};").map do |animal|
        Animal.new({
          :id => animal["id"],
          :name => animal["name"],
          :type => animal["type"],
          :breed => animal["breed"],
          :gender => animal["gender"],
          :date => animal["date"],
          :person_id => animal["person_id"]
        })
      end
    end
  end
end
