#require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(hp=60, id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(hp=60, name, type, db)
#    if db.execute("COL_LENGTH('pokemon', 'hp') IS NOT NULL")
#    @sql_runner = SQLRunner.new(db)
#    @sql_runner.execute_create_hp_column
#    db.execute("INSERT INTO pokemon (hp, name, type) VALUES (?, ?, ?)", hp, name, type)
#    else
#    binding.pry
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#    end
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = (?)", id)[0][0]
    type = db.execute("SELECT type FROM pokemon WHERE id = (?)", id)[0][0]
    return Pokemon.new(60, id: id, name: name, type: type, db: db)
  end

end
