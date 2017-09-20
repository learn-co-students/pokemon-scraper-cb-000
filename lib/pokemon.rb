class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp:60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    if result[0].length > 3
      self.new(id: id, name: result[0][1], type: result[0][2], hp: result[0][3], db: db)
    else
      self.new(id: id, name: result[0][1], type: result[0][2], db: db)
    end
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
    @hp = hp
  end
end
