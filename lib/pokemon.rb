class Pokemon
  attr_accessor :name, :type, :id, :db, :hp
  @@all = []
  def initialize(id)
    @id = id
    @@all << self unless @@all.include?(self)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
    id_array = db.execute("SELECT pokemon.id FROM pokemon WHERE pokemon.name = ?;", name)
    pokemon = Pokemon.new(id_array[0])
    pokemon.name = name
    pokemon.type = type
    pokemon.db = db
  end

  def self.find(id, db)
    Pokemon.new(id).tap do |pokemon|
      pokemon_info = db.execute("SELECT pokemon.name, pokemon.type, pokemon.hp FROM pokemon WHERE pokemon.id =?;", id)
      pokemon.name = pokemon_info.flatten[0]
      pokemon.type = pokemon_info.flatten[1]
      pokemon.hp = pokemon_info.flatten[2]
      pokemon.db = db
    end
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?;", hp, self.id)
    self.hp = hp
  end
end
