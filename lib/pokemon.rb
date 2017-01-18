class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(hash)
    @id = hash[:id]  
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) values (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2])    
  end
end
