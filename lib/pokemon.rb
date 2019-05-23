class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    poke_data = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]

    Pokemon.new(id: poke_data[0], name: poke_data[1], type: poke_data[2], db: db, hp: poke_data[3])
  end

  def alter_hp(new_hp, db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, @id)
  end

end
