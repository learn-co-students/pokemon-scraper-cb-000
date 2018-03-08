class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes={})
    #binding.pry
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    selected_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    self.new(id: selected_pokemon[0][0], name: selected_pokemon[0][1], type: selected_pokemon[0][2], hp: selected_pokemon[0][3], db: db)
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end
end
