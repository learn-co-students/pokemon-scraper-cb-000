require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []

  def initialize(id: nil, name: nil, type: nil, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60 ? hp = nil : hp
    @@all << self
  end

  def self.save( name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", [id])
    pokemon = Pokemon.new(id: id, name: pokemon_info[0][1], type: pokemon_info[0][2], db: db, hp: nil)
    pokemon
  end
end
