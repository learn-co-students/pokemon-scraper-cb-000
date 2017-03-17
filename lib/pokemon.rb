class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    pokemon_id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]
    self.new(id: pokemon_id, name: name, type: type)
  end

end