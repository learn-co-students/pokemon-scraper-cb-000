require "pry"
class Pokemon
attr_accessor :name, :id, :type, :db

  def initialize(id:, name:,type:, db:)
      @id   = id
      @name = name
      @type = type
      @db   = db

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

 def self.find (id, db)
   found_pokemon = db.execute ("SELECT * FROM pokemon WHERE id =#{id}")
   flatten_pokemon = found_pokemon.flatten
   pokemon_object = self.new(id:flatten_pokemon[0], name:flatten_pokemon[1],type: flatten_pokemon[2], db:db)
   pokemon_object
 end

end
