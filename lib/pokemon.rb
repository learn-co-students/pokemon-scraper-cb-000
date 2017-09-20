class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = (?)"
    result = db.execute(sql, id)
    id, name, type, hp = result.first

    new(id: id, name: name, type: type, hp: hp, db: db)
  end

  def alter_hp(new_value, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = #{id}"
    db.execute(sql, new_value)
  end
end
