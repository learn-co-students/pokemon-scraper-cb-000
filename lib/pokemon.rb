class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all =[]
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
  new_index = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  Pokemon.new(id: new_index[0], name: new_index[1], type: new_index[2], db: db)
  end

end
