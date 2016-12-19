class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    new_id, name, type, hp = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: new_id, name: name, type: type, db: db, hp: hp)
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    self.save(db)
  end

  def save(db)
    db.execute("UPDATE pokemon SET name = ?, type = ?, hp = ? WHERE id = ?", self.name, self.type, self.hp, self.id)
    self
  end

end
