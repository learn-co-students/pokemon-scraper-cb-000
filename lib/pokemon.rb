class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id, hp = nil)
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name,  type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    new_pokemon = Pokemon.new(id_num)
    new_pokemon.name = db.execute("SELECT name FROM pokemon WHERE id = #{id_num}").join
    new_pokemon.type = db.execute("SELECT type FROM pokemon WHERE id = #{id_num}").join
    new_pokemon.hp = 60
    return new_pokemon
  end

end
