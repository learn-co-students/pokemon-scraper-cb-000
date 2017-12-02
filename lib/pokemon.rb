class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon(name, type) VALUES (?, ?);', name, type)
  end

  def self.find(id, db)
    db_data = db.execute('SELECT * FROM pokemon WHERE id = ?;', id)
    attrs = db_data[0]
    self.new(id: attrs[0], name: attrs[1], type: attrs[2], db: db, hp: attrs[3])
  end

  def alter_hp(value, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?;', value, self.class.find(self.id, db).id)
  end
end
