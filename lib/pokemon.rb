require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(index, db)
    pk_array = db.execute("SELECT * FROM pokemon WHERE id = ?", [index]).flatten
    Pokemon.new(id: pk_array[0], name: pk_array[1], type: pk_array[2], hp: pk_array[3], db: db)
  end

  def alter_hp(new_health, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_health, @id])
  end

end
