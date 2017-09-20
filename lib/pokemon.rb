class Pokemon

attr_accessor :name, :type, :db, :id#, :hp

  def initialize(name:, type:, db:, id:) #hp: nil
    @id = id
    @name = name
    @type = type
    @db = db
    #@hp = hp
   end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
      pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
      Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db: db) #hp: pokemon_data[3], 
  end

  # def alter(updated_hp, db)
  #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", updated_hp, self.id)
  # end

end
