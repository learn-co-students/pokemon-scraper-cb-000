=begin
  References:
  [1] https://stackoverflow.com/questions/13462112/inserting-ruby-string-into-sqlite
  [2] https://stackoverflow.com/questions/9614236/escaping-strings-for-ruby-sqlite-insert
  [3] http://ruby.bastardsbook.com/chapters/sql/
  [4] https://stackoverflow.com/questions/9917225/how-do-i-use-ruby-to-connect-to-a-sqlite3-database-outside-of-rails-as-a-scripti
  [5] http://zetcode.com/db/sqliteruby/connect/
=end

class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  # find the record in the database and return a Pokemon instance
  # db.execute() returns [[id, pokemon_name, pokemon_type]]
  def self.find(id, db)
    values_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: values_array[0], name: values_array[1], type: values_array[2], hp: values_array[3], db: db)
  end

  def alter_hp(hp, db)
    self.hp = hp
    db.execute("UPDATE pokemon SET hp = ? Where id = ?", self.hp, self.id)
  end

end
