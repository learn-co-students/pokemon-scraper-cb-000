require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp 
  
  @@all = [] 
  
  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
    @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    id, name, type, hp= db.execute("select * from pokemon where id = id").flatten
    Pokemon.new(id:id, name:name, type:type, db:db, hp:hp)
  end 
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end
  
  
end
