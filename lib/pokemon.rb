require'pry'
class Pokemon
  attr_accessor :name, :type, :db, :type, :id
  def initialize(name:,type:,db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    ok = db.execute("SELECT name,type FROM pokemon WHERE pokemon.id = (?)",id)
    name = ok[0][0]
    type = ok[0][1]
    Pokemon.new(name: name,type: type,db: db,id: id)
   end
end
