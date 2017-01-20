class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize (data)
    @id = data[0]
    @name = data[1]
    @type = data[2]
    if data.size == 4
      @hp = data[4]
    else
      @hp = 60
    end
  end

  def self.save (name, type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name,type)
  end

  def self.find (index, db)
    p=Pokemon.new(db.execute("SELECT * FROM pokemon WHERE id = #{index}")[0])
    #db.execute("UPDATE pokemon SET hp='?' WHERE id=#{index}", p.hp)
    p
  end

# ALTER TABLE pokemon ADD hp TEXT;

end
