require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize (attr)
    #is initialized with keyword arguments of name, type, and db
    self.id = attr[id]
    self.name = attr[name]
    self.type = attr[type]
    self.db = attr[db]
  end

  def self.save(name, type, db)
    # database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
    #After called, should exist in database
    # binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    # saves an instance of a pokemon with the correct id
  end

  def self.find(id, db)
    #finds a pokemon from the database by their id number and returns a new pokemon object
    pikachoo = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    # binding.pry
    poke = Pokemon.new(id: pikachoo[0][0], name: pikachoo[0][1], type:pikachoo[0][2], db: @db)

    poke.id = pikachoo[0][0]
    poke.name = pikachoo[0][1]
    poke.type = pikachoo[0][2]
    poke.db = @db
    poke
    # Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
    # binding.pry
  end
end
