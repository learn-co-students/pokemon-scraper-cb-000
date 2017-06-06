class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(attributes)
    attributes.map {|k, v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE pokemon.id = ?", id)
    self.all.detect{|i| i.id == pokemon[0][0]}
  end

end
