class Pokemon
  attr_reader :id,:name,:type,:db

  def initialize(id:id, name:name, type:type, db:db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id:pokemon[0], name:pokemon[1], type:pokemon[2], db:database_connection)
  end
end
