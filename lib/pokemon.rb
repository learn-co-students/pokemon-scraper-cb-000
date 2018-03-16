class Pokemon
  attr_reader :id, :name, :type, :db, :hp
  # dont understand these keyword

# is initialized with keyword arguments of name, type and db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
  end
  #
  def self.find(id, db)
    from = db.execute("select * from pokemon where id = #{id}")
    # p from[0][0]
    # use indexes?

    # expected 0 ?? dont think i was getting that error b4
    # x = self.new(id: from[0], name: from[1], type: from[2], db: db)
    # binding.pry
    # x

    # not sure why this isnt working now
    from_id = from[0][0]
    from_name = from[0][1]
    from_type = from[0][2]
    self.new(id: from_id, name: from_name, type: from_type, hp: from[0][3], db: db)
    # self.new(id: from[0][0], name: from[0][1], type: from[0][2], db)
    # x

  end

  def alter_hp(hp, db)
    # how do i refer to this pokemon, tho?
    # whatever the id instance var is
    # p hp
    db.execute("update pokemon set hp = #{hp} where id = #{@id}")

  end
end
