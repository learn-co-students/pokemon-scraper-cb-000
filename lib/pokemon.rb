require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db 
  end
  
  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?,?)')
    ins.execute(name, type)
    ins = db.prepare("SELECT id FROM pokemon WHERE name = ?")
    rs = ins.execute(name)
    poke = self.new(id: rs.next[0], name: name, type: type, db: db)
  end
  
  def self.find(id, db)
    ins = db.prepare("SELECT name, type FROM pokemon WHERE id = ?")
    poke = ins.execute(id).next
    self.new(id: id, name: poke[0], type: poke[1], db: db)
  end
  
  def alter_hp(hp, db)
    @hp = hp
    ins = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    ins.execute(hp, @id)
    binding.pry
  end
end
