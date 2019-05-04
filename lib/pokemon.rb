class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db
 
  def initialize(name:, type:, db:, id:, hp: nil)
    
     @id = id
     @name = name 
     @type = type
     @hp = @hp
     @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) 
  end
  
  def self.find(id_number, db)
     pokemon_record = db.execute("SELECT * FROM pokemon WHERE id = ?",id_number) .flatten
     Pokemon.new(id: pokemon_record[0], name: pokemon_record[1], type: pokemon_record[2], hp: pokemon_record[3], db: db)
  end
  
  #def alter_hp(hp, db)
   # db.execute("UPDATE pokemon set hp = ? WHERE id =?", hp,self.id)
  #end
    
  
end
