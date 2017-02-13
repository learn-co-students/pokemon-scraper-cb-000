class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]
  end

  def self.save(name,type,db)
    # db.execute('INSERT INTO pokemon (name,type) values (?,?)',name,type)
    db.prepare("INSERT INTO pokemon(name,type) VALUES(?,?)").execute(name,type)
  end

  def self.find(id,db)
    pok = db.execute('SELECT * FROM pokemon WHERE id = ?',id).flatten
    pokemon = new({id: pok[0], name: pok[1], type: pok[2], hp: pok[3], db: db})
  end

  def alter_hp(new_hp,db)
    @hp = new_hp
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?',@hp,@id)
  end

end
