class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(hash, hp = nil)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @hp = hp
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, database)
    array = database.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", pokemon_id).first
    Pokemon.new({id: array[0], name: array[1], type: array[2], db: database}, array[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
