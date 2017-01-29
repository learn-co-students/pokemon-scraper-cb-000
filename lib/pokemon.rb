require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: ,name:, type:, db: , hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end

  def self.save(name,type,db)
    db.prepare("INSERT INTO pokemon VALUES(?,?,?,?)").execute(@id,name,type,@hp)
  end

  def self.find(id,db)
    sample = db.execute("SELECT * FROM pokemon WHERE ID=?",id).flatten
    self.new(id: 1, name: sample[1],type:  sample[2], db: db )
  end
end
