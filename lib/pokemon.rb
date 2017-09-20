class Pokemon

  class << self
    def save(name, type, db)
      inserter = db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
    end

    def find(id, db)
      attributes_from_db = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
      attributes = Hash.new
      attributes[:id]   = attributes_from_db[0][0]
      attributes[:name] = attributes_from_db[0][1]
      attributes[:type] = attributes_from_db[0][2]
      return Pokemon.new(attributes)
    end
  end

  attr_accessor :id, :name, :type, :db, :hp
  def initialize(attributes)
    attributes.each { |key, value| self.send(("#{key}="), value) }
  end

end
