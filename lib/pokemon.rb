class Pokemon

    attr_accessor :name, :type, :db, :id, :hp

    @@all = []

    def initialize(id:, name:, type:, db:, hp:60)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
    end

    def self.find(id, db)
        retrieve_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;",id)[0]
        new_id = retrieve_pokemon[0]
        name = retrieve_pokemon[1]
        type = retrieve_pokemon[2]
        hp = retrieve_pokemon[3]
        pokemon = Pokemon.new(id: new_id, name: name, type: type, db: db, hp: hp)
        pokemon
    end

    def alter_hp(power, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;",power,self.id)
    end

end
