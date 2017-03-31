class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], hp: pokemon_data[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
