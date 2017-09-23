class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    pokemon = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
    if result.size == 4
      pokemon.hp = result[3]
    end
    pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ?;", new_hp)
  end

end
