class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    new_pokemon = self.new(id: result[0][0], name: result[0][1], type: result[0][2], db: db, hp: result[0][3])
  end

  def alter_hp(power, db)
    @hp = power
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", power, @id)
  end
end
