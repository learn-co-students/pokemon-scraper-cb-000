class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end
  
  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id=?;", id).flatten
    
    id = pokemon_data[0]
    name = pokemon_data[1]
    type = pokemon_data[2]
    hp = pokemon_data[3]
    
    self.new(id: id, name: name, type: type, hp: hp, db: db)
  end
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def alter_hp(new_hp, db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", @hp, @id)
  end
end
