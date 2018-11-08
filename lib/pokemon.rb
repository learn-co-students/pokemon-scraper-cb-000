class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_data = db.execute("SELECT id, name, type FROM pokemon WHERE id = 1")[0]
    Pokemon.new(id: poke_data[0], name: poke_data[1], type: poke_data[2], db: db, hp: 60)
    # new_poke
  end

end
