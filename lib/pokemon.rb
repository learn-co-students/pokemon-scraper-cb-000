require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(db = nil, id = nil, name = nil, type = nil, hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    #id =  @@all[0].db[:id]
    #binding.pry
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)", name, type)
  end

  def self.find(id, db)

    return_from_db = db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
    id = return_from_db[0][0]
    name = return_from_db[0][1]
    type = return_from_db[0][2]
    pokemon_from_db_object = Pokemon.new(db, id, name, type)
    #binding.pry
  end

  def alter_hp(new_hp, db)
    pokemon_1 = Pokemon.find(1, db)
    #pokemon_2 = Pokemon.find(2, db)
    #binding.pry
    #pikachu = pokemon_1.name
    #binding.pry
    #pokemon_1.hp = 59
    db.execute("UPDATE pokemon SET hp = 59 WHERE name = 'Pikachu';")
    binding.pry
  end
end

#db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
