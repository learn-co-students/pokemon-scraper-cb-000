class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.results_as_hash = true
    results = db.execute("SELECT * FROM pokemon WHERE id = :id", "id" => id).first
    name = results["name"]
    type = results["type"]
    hp = results["hp"]

    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = :hp WHERE id = :id", "hp" => hp, "id" => @id)
  end

end
