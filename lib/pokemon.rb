class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: NIL)
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
    table_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    return self.new(id: id, name: table_data[1], type: table_data[2], db: db, hp: table_data[3])
  end
  
  def alter_hp(amount, db)
    @hp = amount
    db.execute("UPDATE pokemon SET hp = ?", amount)
  end
  
end
