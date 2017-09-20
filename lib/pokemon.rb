require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp || 60
  end

  def self.save(name,type,db)
    db.prepare("INSERT INTO pokemon(name,type) VALUES(?,?)").execute(name,type)
  end

  def self.find(id,db)
    sample = db.execute("SELECT * FROM pokemon WHERE ID=?",id).flatten
    self.new(id: sample[0], name: sample[1],type:  sample[2], db: db , hp: sample[3])
  end

  def alter_hp(new_hp,db)
    db.prepare("UPDATE pokemon SET hp=? WHERE id=?").execute(new_hp,self.id)
  end
end
