class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize( id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    #@db = db
    @hp = hp
  end

  def self.save( name, type, db)
    db.execute("INSERT INTO pokemon( name, type ) VALUES ( ?, ?) ", [name, type] )
  end

  def self.find( id, db )
    #results = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", [id] ).flatten
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", [id] ).flatten
    Pokemon.new( id: results[0], name: results[1], type: results[2], hp: results[3], db: db)

    #puts "P:#{p}"
    #puts "P-ID:#{p.id}"
    #puts "P-Name:#{p.name}"
    #puts "P-Type:#{p.type}"
    #puts "P-db:#{p.db}"
    #puts "P-hp:#{p.hp}"
    #p
  end

  def alter_hp( hp, db )
    #expect(@db.execute("SELECT hp FROM pokemon").flatten.first).to eq(60)
    puts "** Altering table for ID:#{self.id}, HP:#{hp}, and db:#{db}."
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
  end

end
