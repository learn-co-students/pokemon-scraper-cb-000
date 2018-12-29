class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  def self.save(name, type, db)
    #command = "INSERT INTO pokemon (name, type) VALUES (#{name}, #{type})"
    #db.execute(command)
    db.execute("INSERT INTO pokemon (name, type)
     VALUES ('#{name}', '#{type}');")
  end
  def self.find(id, db)
    zid = db.execute("SELECT id FROM pokemon WHERE id = '#{id}';")
    ztype = db.execute("SELECT type FROM pokemon WHERE id = '#{id}';")
    zname = db.execute("SELECT name FROM pokemon WHERE id = '#{id}';")
    #dude = db.execute(command)
    bro = self.new(id: zid[0][0], name: zname[0][0], type: ztype[0][0], db: db)
    puts bro
    bro
  end
end
