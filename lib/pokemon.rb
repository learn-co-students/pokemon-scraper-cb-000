class Pokemon
  def initialize(id, name = "", type = "", hp = nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def id
    @id
  end

  def name
    @name
  end

  def type
    @type
  end

  def db
    @db
  end

  def hp
    @hp
  end
  
  def self.save(name, type, db)
    ins = db.prepare("insert into pokemon (name, type) VALUES (?, ?)")
    values = [name, type]
    ins.execute(values)
  end

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id = " + id.to_s)
    values = query[0]
    pokemon = Pokemon.new(values[0], values[1], values[2], values[3])
    return pokemon
  end

  def alter_hp(hp, db)
    ins = db.prepare("UPDATE pokemon SET hp = #{hp} WHERE id = #{id}")
    ins.execute()
  end
end
