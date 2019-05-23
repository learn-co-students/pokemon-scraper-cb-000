require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    self  # Needed?  Apparently...
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    result = db.execute("SELECT name,type FROM pokemon WHERE id = ?", id)
    # binding.pry
    Pokemon.new(id:id, name:result[0][0], type:result[0][1], db:db)
  end 
end
