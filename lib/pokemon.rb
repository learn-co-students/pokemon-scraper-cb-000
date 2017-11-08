class Pokemon
  attr_reader :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY,
    name TEXT, type TEXT)")

    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db)
  end
end
