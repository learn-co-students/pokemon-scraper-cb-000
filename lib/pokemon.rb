class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name = nil, type = nil, db = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id, pokemon[1], pokemon[2], db, pokemon[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
end
