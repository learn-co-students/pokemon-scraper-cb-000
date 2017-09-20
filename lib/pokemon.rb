class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(hash)
    hash.each {|k,v| self.send("#{k}=", v)}
  end

  def self.save(name,type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    hash = {
      :id => arr[0],
      :name => arr[1],
      :type => arr[2],
      :hp => arr[3]
    }
    Pokemon.new(hash)
  end

  def alter_hp(hp,db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp, @id)
  end
end
