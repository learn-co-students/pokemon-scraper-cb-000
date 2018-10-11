class Pokemon

  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    self
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute(name, type)
  end

  def self.find(id, db)
    sel = db.prepare('SELECT * FROM pokemon WHERE pokemon.id = ?')
    result = sel.execute(id).next
    pkmn = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db, hp: result[3]) if !result.empty?
  end

  def alter_hp(hp, db)
    @hp = hp
    upd = db.prepare('UPDATE pokemon SET hp = ? WHERE pokemon.id = ?')
    upd.execute(hp, self.id)
  end
end
