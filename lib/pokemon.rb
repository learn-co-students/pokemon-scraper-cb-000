class Pokemon
  attr_accessor :id, :name, :type, :db, :hp


  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(i, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = #{i}").flatten
    pokemon = Pokemon.new(id: poke[0], name: poke[1], type: poke[2])
    pokemon
  end
end
