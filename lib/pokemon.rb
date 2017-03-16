class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)").execute(name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id: data[0][0], name: data[0][1], type: data[0][2], db: db, hp: data[0][3])
  end

end
