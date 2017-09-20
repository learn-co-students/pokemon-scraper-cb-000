class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name=nil, type=nil, db=nil)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    row = db.execute('SELECT id, name, type FROM pokemon WHERE id = (?)', id).first
    pokemon = self.new(row[1], row[2], db)
    pokemon.id = row[0]
    pokemon
  end

  def alter_hp(new_hp, db)
    db.execute('UPDATE pokemon SET hp = (?) WHERE id = (?)', new_hp, @id)
  end

  def hp
    db.execute('SELECT hp FROM pokemon WHERE id = (?)', id).first[0]
  end
end
