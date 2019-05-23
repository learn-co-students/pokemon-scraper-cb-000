class Pokemon
  attr_accessor :db, :name, :type, :id, :hp

  def initialize(id: , name: , type: , db: , hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

  # This function would save/add our data into the table
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name, type)
  end

  # This function would find our data and create an obkect from the table values and return a
  # corresponding array to our sql table.
  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    pokemon_obj = self.new(id: data[0], name: data[1], type: data[2], db: db, hp: data[3])
    pokemon_obj
  end

  # This function updates our hp field and updates our hp instance variable
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, @id)
    @hp = hp;
  end
end
