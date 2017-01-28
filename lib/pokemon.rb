require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: ,name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    db.prepare("INSERT INTO pokemon VALUES(?,?,?)").execute(@id,name,type)
  end

  def self.find(id,db)
    sample = db.execute("SELECT * FROM pokemon WHERE ID=#{id}").flatten
    self.new(id: 1, name: sample[1],type:  sample[2], db: db )
  end
end
