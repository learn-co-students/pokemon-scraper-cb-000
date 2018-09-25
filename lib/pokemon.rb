class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @type = data[:type]
    @db = data[:db]
    @hp = data[:hp] || 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    pokemon = self.new({ name: name, type: type, db: db });
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [pokemon.name, pokemon.type])
    pokemon.id = db.execute("SELECT id FROM pokemon WHERE name = ?", [pokemon.name]).flatten.first
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id]).flatten
    pk_id = data[0]
    pk_name = data[1]
    pk_type = data[2]
    pk_hp = data[3]
    self.new(id: pk_id, name: pk_name, type: pk_type, db: db, hp: pk_hp)
  end

  def alter_hp(hp, db)
    self.hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", [self.hp, self.id])
  end
end
