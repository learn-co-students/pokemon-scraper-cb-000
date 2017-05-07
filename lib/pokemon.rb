

class Pokemon

  attr_accessor :id , :name, :type, :db, :hp 

  def initialize(id: , name: , type: , db: , hp: nil  )
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT, hp INTEGER DEFAULT 60)")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon_arr.flatten!
    if !pokemon_arr.empty?

      return Pokemon.new(id: pokemon_arr[0], name: pokemon_arr[1], type: pokemon_arr[2], db: db, hp: pokemon_arr[3])
    else
      return nil
    end
  end


  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end

end
