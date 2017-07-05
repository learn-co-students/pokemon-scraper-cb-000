class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize( id:, name:, type:, db: )
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save( name, type, db)
    db.execute("INSERT INTO pokemon( name, type ) VALUES ( ?, ?) ", [name, type] )
  end

  def self.find( id, db )
    results = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id ).flatten
    p = Pokemon.new( id: results[0], name: results[1], type: results[2], db: db)
    #puts "P-ID:#{p.id}"
    #puts "P-Name:#{p.name}"
    p
  end

end
