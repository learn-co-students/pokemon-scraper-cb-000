class Pokemon

  attr_accessor :id, :db, :name, :type

  @@all = []

  def initialize(id:, db:, name:, type:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    Pokemon.new(id: @id ,name: name, type: type, db: db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    Pokemon.all.find {|pokemon| pokemon.id = id}
  end

  def self.all
    @@all
  end
end
