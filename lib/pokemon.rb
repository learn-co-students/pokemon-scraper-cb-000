class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db  = db
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?  WHERE id = ?", hp, self.id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    id = query[0]
    name = query[1]
    type = query[2]
    hp = query[3]
    db = query[4]
    self.new(id: id, name: name, type: type, hp: hp, db: db)
  end
end
